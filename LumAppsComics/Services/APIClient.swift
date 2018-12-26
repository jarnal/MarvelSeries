//
//  AppCoordinator.swift
//  LumAppsComics
//
//  Created by Jonathan Arnal on 17/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import Foundation

class APIClient: API {
    
    // **************************************************************
    // MARK: - Singleton
    // **************************************************************
    
    public static let shared: API = APIClient()
    private init() {}
    
    // **************************************************************
    // MARK: - Environment
    // **************************************************************
    
    private let environmentFileName = "Environment"
    private let environmentExtension = "plist"
    private let apiURLKey = "API"
    private let apiPublicTokenKey = "API_PUBLIC_KEY"
    private let apiPrivateTokenKey = "API_PRIVATE_KEY"
    
    /// Returns environment plist as NSDictionary
    private lazy var environment: NSDictionary = {
        guard
            let path = Bundle.main.path(forResource: environmentFileName, ofType: environmentExtension),
            let envDict = NSDictionary(contentsOfFile: path)
        else {
            fatalError("plist was not found")
        }
        return envDict
    }()
    
    /// Returns the api base url string
    private var apiDomainUrl: URL {
        guard
            let apiString = environment.object(forKey: apiURLKey) as? String,
            let apiURL = URL(string: apiString)
        else {
            fatalError("API URL is in wrong format")
        }
        return apiURL
    }
    
    /// Returns the api token
    private var apiKey: APIKey {
        let publicKey = environment.object(forKey: apiPublicTokenKey) as! String
        let privateKey = environment.object(forKey: apiPrivateTokenKey) as! String
        return APIKey(publicKey: publicKey, privateKey: privateKey)
    }
    
    // **************************************************************
    // MARK: - APIs
    // **************************************************************
    
    public lazy var series: SeriesAPIProtocol = {
        return SeriesAPI(withAPIURL: apiDomainUrl, andKey: apiKey)
    }()
    
    public lazy var comics: ComicsAPIProtocol = {
        return ComicsAPI(withAPIURL: apiDomainUrl, andKey: apiKey)
    }()
    
}

