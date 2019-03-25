//
//  Coin.swift
//  KataSlotsApp
//
//  Created by Yannick Vanderstraeten on 22/03/2019.
//  Copyright © 2019 TeleSoftas. All rights reserved.
//

import Foundation

enum Coin {
    case nickel
    case dime
    case quarter
    case dollar

    var name: String {
        switch self {
        case .nickel:
            return "NICKEL"
        case .dime:
            return "DIME"
        case .quarter:
            return "QUARTER"
        case .dollar:
            return "DOLLAR"
        }
    }

    var value: Float {
        switch self {
        case .nickel:
            return 0.05
        case .dime:
            return 0.10
        case .quarter:
            return 0.25
        case .dollar:
            return 1.00
        }
    }
}
