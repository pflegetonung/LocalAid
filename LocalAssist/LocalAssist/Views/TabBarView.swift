//
//  TabBarView.swift
//  LocalAssist
//
//  Created by Phillip on 06.10.2024.
//

import SwiftUI
import MapKit

struct TabBarView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Events")
                }

            MapView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }

            MessagesView()
                .tabItem {
                    Image(systemName: "message.badge.filled.fill")
                    Text("Messages")
                }
        }
    }
}

#Preview {
    TabBarView()
}
