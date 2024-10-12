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
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    
                    NavigationLink(destination: SettingsView()) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 22)
                                .frame(height: 120)
                                .foregroundColor(.white)
                            
                            HStack {
                                ZStack {
                                    Image("person")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 80)
                                        .cornerRadius(100)
                                        .shadow(color: Color.black, radius: 1)
                                        .padding(2)
                                    
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 24)
                                            .frame(width: 32, height: 32)
                                            .foregroundColor(colorScheme == .dark ? Color.black : Color.white)
                                            .shadow(color: Color(.systemGray), radius: 1)
                                        
                                        Text("🐥")
                                    }
                                    .offset(x: 28, y: -28)
                                }
                                
                                VStack(alignment: .leading) {
                                    Text("User Name")
                                        .font(.montserrat(size: 24, weight: "Bold"))
                                        .foregroundColor(.black)
                                        .padding(.top)
                                    
                                    Text("@username")
                                        .font(.montserrat(size: 16, weight: "Bold"))
                                        .foregroundColor(Color(.systemGray))
                                        .padding(.bottom, 4)
                                }
                                .padding(.leading, 8)
                                
                                Spacer()
                                
                                Image("Right")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 24)
                            }
                            .padding(.horizontal)
                        }
                    }
                    
                    Text("Chats")
                        .padding(.top, 8)
                        .font(.montserrat(size: 24, weight: "Bold"))
                }
                .padding()
            }
        }
    }
}

#Preview {
    SettingsView()
}

struct SettingsView: View {
    @Environment(\.colorScheme) var colorScheme
    
    let names = ["Alice", "Bob", "Charlie", "David", "Eve"]
    
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ZStack {
                        Image("person")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                            .cornerRadius(100)
                            .shadow(color: Color.black, radius: 1)
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 22)
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
                    
                    Text("User Name")
                        .font(.system(size: 32, weight: .bold))
                    
                    Text("@username")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(Color(.systemGray))
                        .padding(.bottom, 4)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(height: 128)
                            .foregroundColor(Color(.systemGray6))
                    }
                    .padding(.top)
                }
                .padding()
            }
        }
    }
}
