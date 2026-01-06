//
//  File.swift
//  Shared
//
//  Created by partnertientm2 on 6/1/26.
//

import UIKit
import Combine

extension UIButton {
    var tapPublisher: AnyPublisher<Void, Never> {
        publisher(for: .touchUpInside)
            .eraseToAnyPublisher()
    }
}
