//
//  AppCoordinator.swift
//  LumAppsComics
//
//  Created by Jonathan Arnal on 17/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import Foundation

class BaseAPI {
    
    // **************************************************************
    // MARK: - Variables
    // **************************************************************
    
    internal var apiURL: URL
    internal var apiKey: APIKey
    
    internal lazy var session: URLSession = {
        return URLSession(configuration: URLSessionConfiguration.default)
    }()
    
    internal var retryInterval: DispatchTime {
        return .now() + 3
    }
    
    // **************************************************************
    // MARK: - Init
    // **************************************************************
    
    /// 🏭 Initialization
    ///
    /// - Parameter apiURL: base API url
    init(withAPIURL apiURL: URL, andKey apiKey: APIKey) {
        self.apiURL = apiURL
        self.apiKey = apiKey
    }
    
    // **************************************************************
    // MARK: - Build URL
    // **************************************************************
    
    /// 🚧 Build an url with corresponding url parameters
    ///
    /// - Parameter router: router
    /// - Returns: ready to send url
    internal func buildURL(forRouter router: APIRequestConvertible) -> URL? {
        
        let baseURL = buildBaseURL(withRouter: router)
        
        guard var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: false) else { return nil }
        
        var queryItems = [URLQueryItem]()
        injectAuthorization(insideQueryItems: &queryItems)
        
        if let urlParams = router.urlParams, !urlParams.isEmpty {
            for param in urlParams {
                queryItems.append(URLQueryItem(name: param.key, value: String(describing: param.value)))
            }
        }
        components.queryItems = queryItems
        
        return components.url
    }
    
    /// 🚧 Build base url depending on router data
    ///
    /// - Parameter router: router containing routing data
    /// - Returns: ready to use url
    private func buildBaseURL(withRouter router: APIRequestConvertible) -> URL {
        
        var baseURL = self.apiURL
        if let path = router.path {
            baseURL = baseURL.appendingPathComponent(router.route).appendingPathComponent(path, isDirectory: false)
        } else {
            baseURL = baseURL.appendingPathComponent(router.route, isDirectory: false)
        }
        
        return baseURL
    }
    
    /// 💉 Injects apikey data inside a specific list of url query items
    ///
    /// - Parameter queryItems: query items where api key data has to be set
    private func injectAuthorization( insideQueryItems queryItems: inout [URLQueryItem]) {
        
        let timestamp = "\(Int(Date().timeIntervalSince1970))"
        queryItems.append( URLQueryItem(name: "ts", value: timestamp)  )
        queryItems.append( URLQueryItem(name: "hash", value: self.apiKey.hash(withTimeStampString: timestamp) )  )
        queryItems.append( URLQueryItem(name: "apikey", value: self.apiKey.publicKey )  )
    }
    
    // **************************************************************
    // MARK: - Build Request
    // **************************************************************
    
    /// 🚧 Builds an `NSMutableURLRequest` object depending on an `APIRequestConvertible`
    ///
    /// - Parameter route: router containing api call informations
    /// - Returns: NSMutableURLRequest
    internal func buildRequest(forRouter router: APIRequestConvertible) -> URLRequest? {
        
        guard let finalURL = buildURL(forRouter: router) else { return nil }
        
        let urlRequest = NSMutableURLRequest(url: finalURL)
        urlRequest.httpMethod = router.method.rawValue
        urlRequest.allHTTPHeaderFields = router.headers
        
        if let unwrappedParameters = router.params {
            let data: Data = NSKeyedArchiver.archivedData(withRootObject: unwrappedParameters)
            urlRequest.httpBody = data
        }
        
        log(request: urlRequest as URLRequest, withParameters: nil)
        
        return urlRequest as URLRequest
    }
    
    // **************************************************************
    // MARK: - Handle Request
    // **************************************************************
    
    /// ⬆️ Send and process a request to the server and allows to retry call if failed
    ///
    /// - Parameters:
    ///   - request: urlRequest to send
    ///   - block: block to call once it's done
    ///   - attempts: retry attempts available
    /// - Returns: session task
    @discardableResult internal func sendRequest<T: Codable>(_ request: URLRequest?, then block: @escaping (Result<T>) -> Void, attempts: Int) -> URLSessionTask? {
        
        let closure: (Result<T>) -> Void = { [weak self] result in
            
            guard let strongSelf = self else { return }
            
            // If there is an error, and we got some attempts, we launch again the request
            if case Result.error = result, attempts > 0 {
                DispatchQueue.global().asyncAfter(deadline: strongSelf.retryInterval) {
                    strongSelf.sendRequest(request, then: block, attempts: attempts-1)
                }
            } else { // If result is .valid or we got no attempts, calling completion block
                block(result)
            }
        }
        
        let task = sendRequest(request, then: closure)
        return task
    }
    
    /// ⬆️ Send and process a request to the server
    ///
    /// - Parameters:
    ///   - request: urlRequest to send
    ///   - block: block to call once it's done
    /// - Returns: session task
    internal func sendRequest<T: Codable>(_ request: URLRequest?, then block: @escaping (Result<T>) -> Void ) -> URLSessionTask? {
        
        guard let request = request else {
            block(.error(CustomError.wrongURL))
            return nil
        }
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
            
            guard let strongSelf = self else { return }
            
            if let unwrappedError = error {
                block( .error(unwrappedError) )
                return
            }
            
            let result = strongSelf.parseResult(of: data, modelType: T.self)
            block(result)
        }
        task.resume()
        
        return task
        
    }
    
    // **************************************************************
    // MARK: - Parse Request
    // **************************************************************
    
    /// 🕵️‍♂️ Parse the result of a network response
    ///
    /// - Parameters:
    ///   - dataResponse: data returned by server
    ///   - modelType: model type to build
    /// - Returns: result of the data result (either .valid or .error)
    internal func parseResult<T: Codable>(of dataResponse: Data?, modelType: T.Type) -> Result<T> {
        
        // If nothing is present in result, request has failed, no network is available
        guard let unwrappedData = dataResponse else { return .error(CustomError.noJsonInResponse) }
        
        // Building expected models data
        do {
            let data = try JSONDecoder().decode(T.self, from: unwrappedData)
            return .valid(data)
        } catch {
            return .error(error)
        }
    }
    
    //****************************************************
    // MARK: - Logging Method
    //****************************************************
    
    /// 📷 Logs the request to show what has been called
    ///
    /// - Parameters:
    ///   - request: request to log in console
    ///   - parameters: parameters sent in the request
    private func log(request: URLRequest, withParameters parameters: [String: Any]?) {
        
        let httpEmoji: String
        switch request.httpMethod! {
        case HTTPMethod.get.rawValue:
            httpEmoji = "⬇️"
        case HTTPMethod.post.rawValue:
            httpEmoji = "⬆️"
        case HTTPMethod.put.rawValue:
            httpEmoji = "🔄"
        default:
            httpEmoji = ""
        }
        
        print("\n")
        print("\(httpEmoji) \(request.httpMethod!) :: \(request.url!)")
        if let params = parameters {
            print("➡️ \(params)")
        }
    }
    
}
