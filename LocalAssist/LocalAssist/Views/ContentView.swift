//
//  ContentView.swift
//  LocalAssist
//
//  Created by Phillip on 19.10.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ExploreView()
            .environmentObject(LocationManager())
    }
}

#Preview {
    ContentView()
}
