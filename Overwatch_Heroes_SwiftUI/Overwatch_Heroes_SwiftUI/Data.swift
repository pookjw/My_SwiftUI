//
//  Data.swift
//  Test1
//
//  Created by pook on 10/29/19.
//  Copyright © 2019 pookjw. All rights reserved.
//

import Foundation
import SwiftUI

let heroes: [Hero] = load("Data.json")

struct Hero: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var description: String
    var profileImage: String
    var backgroundImage: String
    var health: Int
    var difficulty: Int
    var favorite: Bool
    var category: Category

    enum Category: String, CaseIterable, Codable, Hashable {
        case tank = "Tank"
        case support = "Support"
        case damage = "Damage"
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

final class userData: ObservableObject{
    @Published var showOnlyFavorite = false
    @Published var heroData = heroes
    @Published var showLegacyList = false
    @Published var showLogoSheet = false
}


