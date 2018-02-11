//
//  GetBuildsByAppSlugRequest.swift
//  BitriseAPI
//
//  Created by Joel Trew on 11/02/2018.
//

import Foundation

struct GetBuildsByAppSlugRequest: PagedAPIRequest {
    
    var appSlug: String
    
    var endpoint: String = "builds"
    
    typealias ResponseType = [Build]
    
    let httpMethod: HTTPMethod = .get
    
    var body: Data? = nil
    
    var baseUrl: URL
    
    init(baseUrl: URL, appSlug: String) {
        self.baseUrl = baseUrl
        self.appSlug = appSlug
    }
    
    func createUrl() -> URL {
        let url = baseUrl.appendingPathComponent("apps")
            .appendingPathComponent(appSlug)
            .appendingPathComponent(endpoint)
        let urlWithQueries = addQueries(to: url)
        
        return urlWithQueries
    }
}