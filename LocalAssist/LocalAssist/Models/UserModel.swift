//
//  UserModel.swift
//  LocalAssist
//
//  Created by Phillip on 13.10.2024.
//

import Foundation
import SwiftUI

struct User: Identifiable {
    var id = UUID()
    var name: String
    var username: String
    var status: Int // 1 - Volunteer, 2 - Activist, 3 - Organization
    var isVerified: Bool
}

let userData = [
    User(name: "Example User",
         username: "username",
         status: 1,
         isVerified: false),
    
    User(name: "Example Organization",
         username: "organization",
         status: 3,
         isVerified: true)
]
