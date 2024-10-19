//
//  FavoritesView.swift
//  LocalAssist
//
//  Created by Phillip on 13.10.2024.
//

import SwiftUI

struct FavoritesView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @State private var isEmpty = true
    
    var body: some View {
        if isEmpty {
            HStack {
                Spacer()
                
                if colorScheme == .light {
                    Text("You have no favorites yet.")
                        .foregroundColor(.black)
                        .font(.montserrat(size: 16, weight: "Regular"))
                        .padding(8)
                        .padding(.horizontal, 4)
                        .background(
                            CustomBlur.Blur(style: .extraLight)
                        )
                        .cornerRadius(64)
                } else {
                    Text("You have no favorites yet.")
                        .foregroundColor(.white)
                        .font(.montserrat(size: 16, weight: "Regular"))
                        .padding(8)
                        .padding(.horizontal, 4)
                        .background(
                            CustomBlur.Blur(style: .dark)
                        )
                        .cornerRadius(64)
                }
                
                Spacer()
            }
            .padding()
            
        } else {
            ScrollView {
                VStack {
                    
                }
            }
        }
    }
}

#Preview {
    FavoritesView()
}
