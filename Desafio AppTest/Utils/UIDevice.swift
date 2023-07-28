//
//  UIDevice.swift
//  Desafio AppTest
//
//  Created by Ezequias Santos on 26/07/23.
//

import Foundation
import UIKit

public extension UIDevice {
    static let hardwareModel: String = {
    var path = [CTL_HW, HW_MACHINE]
    var n = 0
        sysctl(&path, 2, nil, &n, nil, 0)
    var a: [UInt8] = .init(repeating: 0, count: n)
        sysctl(&path, 2, &a, &n, nil, 0)
        return .init(cString: a)     }() }
