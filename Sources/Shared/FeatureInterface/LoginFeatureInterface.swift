//
//  LoginFeatureInterface.swift
//  Shared
//
//  Created by partnertientm2 on 3/11/25.
//

import UIKit

public protocol LoginFeatureInterface {
    
    func makeLoginViewController() -> UIViewController
    func makeRegisterViewController() -> UIViewController
}
