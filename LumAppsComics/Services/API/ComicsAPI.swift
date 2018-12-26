//
//  AppCoordinator.swift
//  LumAppsComics
//
//  Created by Jonathan Arnal on 17/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import Foundation

class ComicsAPI: BaseAPI, ComicsAPIProtocol {
    
    /// ⬇️ Load items from server
    ///
    /// - Parameter block: completion block to call once the data has been retrieved
    /// - Returns: task (allowing to cancel it)
    @discardableResult public func getItems(then block: @escaping (Result<APIResult<Comic>>) -> Void) -> URLSessionTask? {
        
        let request = buildRequest(forRouter: ComicsRouter.getAll(["format":"comic"]))
        return sendRequest(request, then: block, attempts: 3)
    }
    
}
