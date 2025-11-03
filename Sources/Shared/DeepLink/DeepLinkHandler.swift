//
//  File.swift
//  Shared
//
//  Created by partnertientm2 on 3/11/25.
//
import UIKit

public protocol DeepLinkHandler {
    func canHandle(_ link: DeepLink) -> Bool
    func viewController(for link: DeepLink) -> UIViewController?
}
