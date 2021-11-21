//
//  Category.swift
//
//  Created by Andrej Saric.
//

import Foundation

enum Category: Int, CustomStringConvertible, Codable {
    case technology = 1
    case gaming = 2
    case apple = 3
    case entertainment = 4
    case iOS = 5
    case sport = 6

    var description: String {
        switch self {
        case .technology:
            return "Technology"
        case .gaming:
            return "Gaming"
        case .apple:
            return "Apple"
        case .entertainment:
            return "Entertainment"
        case .iOS:
            return "iOS"
        case .sport:
            return "Sport"
        }
    }
}
