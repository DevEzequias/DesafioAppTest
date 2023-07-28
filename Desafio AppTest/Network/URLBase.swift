//
//  URLBase.swift
//  Desafio AppTest
//
//  Created by Ezequias Santos on 26/07/23.
//

import Foundation

struct URLBase {
    private static let environmentFile = Bundle.main.path(forResource: "environment", ofType: "plist")

    static func baseUrl() -> String {
        if let environmentFile = environmentFile {
            if let environmentDictionary = NSDictionary(contentsOfFile: environmentFile) {
                return environmentDictionary["appTestBaseUrl"] as? String ?? ""
            }
        }
        return ""
    }
    
    static func version() -> String {
        if let environmentFile = environmentFile {
            if let environmentDictionary = NSDictionary(contentsOfFile: environmentFile) {
                return environmentDictionary["appTestVersion"] as? String ?? ""
            }
        }
        return ""
    }
}

var appTestBaseUrl = URLBase.baseUrl()
let appTestVersion = URLBase.version()
let appTestTimeOut = 120.0
let appTestCacheControl = "private, no-cache, no-store"
