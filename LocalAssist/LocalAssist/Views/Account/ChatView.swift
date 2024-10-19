//
//  ProfileView.swift
//  LocalAssist
//
//  Created by Phillip on 07.10.2024.
//

import SwiftUI

struct ChatView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @State private var isSettings = false
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    
                    NavigationLink(destination: ProfileView()) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 22)
                                .frame(height: 120)
                                .foregroundColor(colorScheme == .light ? .white : .black)
                            
                            HStack {
                                ZStack {
                                    ZStack {
                                        ZStack {
                                            if colorScheme == .light {
                                                CustomBlur.Blur(style: .extraLight)
                                            } else {
                                                CustomBlur.Blur(style: .dark)
                                            }
                                            
                                            Image((colorScheme == .light ? "Profile" : "Profileb"))
                                                .resizable()
                                                .scaledToFit()
                                                .frame(height: 32)
                                        }
                                        
//                                        Image("person")
//                                            .resizable()
//                                            .scaledToFit()
//                                            .shadow(color: Color.black, radius: 1)
//                                            .padding(2)
                                    }
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(64)
                                    
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
                                        .foregroundColor(colorScheme == .light ? .black : .white)
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
//                    .sheet(isPresented: $isSettings) {
//                        ProfileView()
//                            .presentationCornerRadius(32)
//                            .presentationBackground(content: {
//                                if colorScheme == .light {
//                                    CustomBlur.Blur(style: .extraLight)
//                                } else {
//                                    CustomBlur.Blur(style: .dark)
//                                }
//                            })
//                    }
                    
                    Text("Chats")
                        .padding(.top, 8)
                        .font(.montserrat(size: 24, weight: "Bold"))
                    
                    ForEach(0 ..< 5) { item in
                        HStack {
                            ZStack {
                                ZStack {
                                    if colorScheme == .light {
                                        CustomBlur.Blur(style: .extraLight)
                                    } else {
                                        CustomBlur.Blur(style: .dark)
                                    }
                                    
                                    Image(colorScheme == .light ? "Profile" : "Profileb")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 24)
                                }
                                
//                                        Image("person")
//                                            .resizable()
//                                            .scaledToFit()
//                                            .shadow(color: Color.black, radius: 1)
//                                            .padding(2)
                            }
                            .frame(width: 60, height: 60)
                            .cornerRadius(64)
                            
                            VStack(alignment: .leading) {
                                Text("User Name")
                                    .font(.montserrat(size: 18, weight: "Medium"))
                                    .foregroundColor(colorScheme == .light ? .black : .white)
                                    .padding(.top)
                                
                                HStack {
                                    Text("Some words of me to you")
                                        .lineLimit(1)
                                        .font(.montserrat(size: 14, weight: "Regular"))
                                        .foregroundColor(Color(.systemGray))
                                        .padding(.bottom, 4)
                                    
                                    Spacer()
                                    
                                    Text("10:09 am")
                                        .font(.montserrat(size: 14, weight: "Regular"))
                                        .foregroundColor(Color(.systemGray2))
                                }
                            }
                        }
                        .padding(.vertical, 8)
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    ChatView()
}
