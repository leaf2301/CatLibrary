//
//  Model.swift
//  CatLibrary
//
//  Created by Tran Hieu on 12/05/2023.
//

import Foundation

struct CatModel: Codable, Identifiable {
    var id, name: String
    var temperament: String
    var origin: String
    var description: String
    var lifeSpan: String
    var affectionLevel, childFriendly: Int
    var energyLevel: Int
    var isHairless: Bool
    var image: CatImage?
    
//    var shortDescription: String {
//        return "Cat's Name: \(name) and id: \(id), origin: \(origin), description: \(description), life span :\(lifeSpan), energy level: \(energyLevel), isHairless: \(isHairless ? "YES" : "NO")."
//    }
    
    /*
     let countryCodes, countryCode: String
     let indoor: Int
     let altNames: String
     let adaptability, dogFriendly: Int
     let grooming, healthIssues, intelligence: Int
     let sheddingLevel, socialNeeds, strangerFriendly, vocalisation: Int
     let experimental, natural, rare: Int
     let rex, suppressedTail, shortLegs: Int
     let wikipediaURL: String
     let hypoallergenic: Int
     let referenceImageID: String
     */ //ForMore
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case temperament, origin
        case description
        case lifeSpan = "life_span"
        case affectionLevel = "affection_level"
        case childFriendly = "child_friendly"
        case energyLevel = "energy_level"
        case isHairless = "hairless"
        case image
        
        /*
         case countryCodes = "country_codes"
         case countryCode = "country_code"
         case indoor
         case altNames = "alt_names"
         case adaptability
         case dogFriendly = "dog_friendly"
         case grooming
         case healthIssues = "health_issues"
         case intelligence
         case sheddingLevel = "shedding_level"
         case socialNeeds = "social_needs"
         case strangerFriendly = "stranger_friendly"
         case vocalisation
         case experimental, natural, rare, rex
         case suppressedTail = "suppressed_tail"
         case shortLegs = "short_legs"
         case wikipediaURL = "wikipedia_url"
         case hypoallergenic
         case referenceImageID = "reference_image_id"
         */ //ForMore
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try values.decode(String.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        origin = try values.decode(String.self, forKey: .origin)
        lifeSpan = try values.decode(String.self, forKey: .lifeSpan)
        affectionLevel = try values.decode(Int.self, forKey: .affectionLevel)
        childFriendly = try values.decode(Int.self, forKey: .childFriendly)
        energyLevel = try values.decode(Int.self, forKey: .energyLevel)
        let hairless = try values.decode(Int.self, forKey: .isHairless)
        isHairless = hairless == 1
        temperament = try values.decode(String.self, forKey: .temperament)
        description = try values.decode(String.self, forKey: .description)
        image = try values.decodeIfPresent(CatImage.self, forKey: .image)
    }
    
    init(id: String, name: String, origin: String, lifeSpan: String, affectionLevel: Int, childFriendly: Int, energyLevel: Int, isHairless: Bool, temperament: String, description: String, image: CatImage?) {
        self.id = id
        self.name = name
        self.origin = origin
        self.lifeSpan = lifeSpan
        self.affectionLevel = affectionLevel
        self.childFriendly = childFriendly
        self.energyLevel = energyLevel
        self.isHairless = isHairless
        self.temperament = temperament
        self.description = description
        self.image = image
    }
    
    static let example = CatModel(id: "abys", name: "Abyssinian", origin: "Egypt", lifeSpan: "14 - 15", affectionLevel: 5, childFriendly: 3, energyLevel: 5, isHairless: true, temperament: "", description: "The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.", image: nil)
    
}

