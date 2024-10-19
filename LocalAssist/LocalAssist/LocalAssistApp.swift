//
//  LocalAssistApp.swift
//  LocalAssist
//
//  Created by Phillip on 06.10.2024.
//

import SwiftUI

@main
struct LocalAssistApp: App {
    @StateObject var locationManager = LocationManager()
    
    var body: some Scene {
        WindowGroup {
            ExploreView()
                .environmentObject(locationManager)
        }
    }
}
