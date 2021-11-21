//
//  NewsStand.swift
//
//  Created by Andrej Saric.
//

import Foundation

struct NewsStand: Codable, Identifiable {
    let id: Int
    let name: String
    let location: Location
    let category: Category
}
