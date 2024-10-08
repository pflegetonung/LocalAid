//
//  ProfileView.swift
//  LocalAssist
//
//  Created by Phillip on 07.10.2024.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.black)
                .ignoresSafeArea()
            
            VStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 48, height: 8)
                    .foregroundColor(Color(.systemGray).opacity(0.5))
                    .padding()
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        ZStack {
                            Image("profile")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150, height: 150)
                                .cornerRadius(100)
                                .shadow(color: Color.black, radius: 1)
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 24)
                                    .frame(width: 48, height: 48)
                                    .foregroundColor(colorScheme == .dark ? Color.black : Color.white)
                                    .shadow(color: Color(.systemGray), radius: 1)
                                
                                Text("🐥")
                            }
                            .offset(x: 56, y: -56)
                        }
                        
                        Text("Volunteer")
                            .font(.system(size: 16))
                            .foregroundColor(Color(.systemGray))
                        
                        Text("Lori Meyers")
                            .font(.system(size: 32, weight: .bold))
                            .padding(.top)
                        
                        Text("@meyers")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(Color(.systemGray))
                            .padding(.bottom, 4)
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .frame(height: 128)
                                .foregroundColor(Color(.systemGray6))
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
