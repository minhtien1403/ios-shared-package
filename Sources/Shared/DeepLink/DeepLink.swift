//
//  File.swift
//  Shared
//
//  Created by partnertientm2 on 3/11/25.
//

import Foundation

public struct DeepLink {
    
    public let path: String
    public let parameters: [String: String]
    
    public init(path: String, parameters: [String: String] = [:]) {
        self.path = path
        self.parameters = parameters
    }
}
