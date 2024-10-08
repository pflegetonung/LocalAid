//
//  SectionModel.swift
//  LocalAssist
//
//  Created by Phillip on 07.10.2024.
//

import Foundation
import SwiftUI

struct SectionCard: Identifiable {
    var id = UUID()
    var title: String
    var description: String
    var emoji: String
    var color1: Color
    var color2: Color
}

let sectionData = [
    SectionCard(title: "Kentucky",
            description: "Louisville",
            emoji: "⛅️",
            color1: .red,
            color2: .blue),
    
    SectionCard(title: "TestTitle2",
            description: "TestDesctiption2",
            emoji: "⭐️",
            color1: .green,
            color2: .blue),
    
    SectionCard(title: "TestTitle3",
            description: "TestDesctiption3",
            emoji: "🇺🇸",
            color1: .yellow,
            color2: .pink)
]
