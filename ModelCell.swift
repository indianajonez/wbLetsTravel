//
//  ModelCell.swift
//  MyHabits
//
//  Created by Ekaterina Saveleva on 12.05.2023.
//

import Foundation
import UIKit

struct CustomCell: Codable {
    let id = UUID()
    let cityLeaved: String
    let cityArravived: String
    let dateLeave: String
    let dateArrived: String
    let cost: Double
    let isLike: Bool
}


var mocData: [CustomCell] = [
    CustomCell(cityLeaved: "Spb", cityArravived: "Msc", dateLeave: "15.01", dateArrived: "16.01", cost: 15000, isLike: true),
    CustomCell(cityLeaved: "Msc", cityArravived: "Spb", dateLeave: "15.01", dateArrived: "16.01", cost: 5000, isLike: false),
    CustomCell(cityLeaved: "Spb", cityArravived: "Kzn", dateLeave: "15.01", dateArrived: "16.01", cost: 12000, isLike: true),
    CustomCell(cityLeaved: "Spb", cityArravived: "Msc", dateLeave: "15.01", dateArrived: "16.01", cost: 1000, isLike: false),
    CustomCell(cityLeaved: "Kzn", cityArravived: "Msc", dateLeave: "15.01", dateArrived: "16.01", cost: 55000, isLike: false)
]
