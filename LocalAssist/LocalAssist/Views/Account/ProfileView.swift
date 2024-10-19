//
//  SettingsView.swift
//  LocalAssist
//
//  Created by Phillip on 14.10.2024.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.presentationMode) var presentationMode
    
    @State private var isArchive = false
    @State private var isSettings = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(colorScheme == .light ? .white : .black)
                .ignoresSafeArea()
            
            VStack {
                if isSettings {
                    SettingsView()
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        ZStack {
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
                                        .frame(height: 64)
                                        .padding(2)
                                }
                                
                                //                            Image("person")
                                //                                .resizable()
                                //                                .scaledToFit()
                                //                                .shadow(color: Color.black, radius: 1)
                            }
                            .frame(width: 150, height: 150)
                            .cornerRadius(100)
                            .shadow(color: Color(.systemGray2), radius: 1)
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 64)
                                    .frame(width: 48, height: 48)
                                    .foregroundColor(colorScheme == .dark ? Color.black : Color.white)
                                    .shadow(color: Color(.systemGray), radius: 1)
                                
                                Text("🐥")
                                    .font(.system(size: 24))
                            }
                            .offset(x: 56, y: -56)
                        }
                        .padding(.top)
                        
                        Text("Nonprofit Organization")
                            .font(.system(size: 16))
                            .foregroundColor(Color(.systemGray))
                        
                        Text("User Name")
                            .font(.system(size: 32, weight: .bold))
                        
                        Text("@username")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(Color(.systemGray))
                            .padding(.bottom, 4)
                        
                        LevelView()
                            .cornerRadius(20)
                            .frame(height: 170)
                            .padding(.top)
                        
                        HStack(spacing: 8) {
                            Spacer()
                            
                            Button {
                                withAnimation {
                                    isArchive = false
                                }
                            } label: {
                                Text("Posts")
                                    .font(.montserrat(size: 20, weight: "Bold"))
                                    .foregroundColor(isArchive ? Color(.systemGray2) : (colorScheme == .dark ? .white : .black))
                            }
                            
                            Button {
                                withAnimation {
                                    isArchive = true
                                }
                            } label: {
                                Text("Archive")
                                    .font(.montserrat(size: 20, weight: "Bold"))
                                    .foregroundColor(isArchive ? (colorScheme == .dark ? .white : .black) : Color(.systemGray2))
                            }
                            
                            Spacer()
                        }
                        .padding()
                    }
                    .padding()
                }
            }
            
            VStack {
                HStack {
                    Button {
                        withAnimation {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    } label: {
                        if colorScheme == .light {
                            Image("Left")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 20)
                                .padding(12)
                                .background(
                                    CustomBlur.Blur(style: .extraLight)
                                        .cornerRadius(64)
                                )
                        } else {
                            Image("Leftb")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 20)
                                .padding(12)
                                .background(
                                    CustomBlur.Blur(style: .dark)
                                        .cornerRadius(64)
                                )
                        }
                    }
                    
                    Spacer()
                    
                    Button {
                        withAnimation {
                            isSettings.toggle()
                        }
                    } label: {
                        if colorScheme == .light {
                            Text(isSettings ? "Profile" : "Settings")
                                .foregroundColor(.black)
                                .font(.montserrat(size: 16, weight: "Semibold"))
                                .padding(8)
                                .padding(.horizontal, 4)
                                .background(
                                    CustomBlur.Blur(style: .extraLight)
                                )
                                .cornerRadius(64)
                        } else {
                            Text(isSettings ? "Profile" : "Settings")
                                .foregroundColor(.white)
                                .font(.montserrat(size: 16, weight: "Semibold"))
                                .padding(8)
                                .padding(.horizontal, 4)
                                .background(
                                    CustomBlur.Blur(style: .dark)
                                )
                                .cornerRadius(64)
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.top)
                
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ProfileView()
}

struct LevelView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @State private var isRewards = false
    
    var body: some View {
        ZStack {
            if colorScheme == .light {
                CustomBlur.Blur(style: .extraLight)
            } else {
                CustomBlur.Blur(style: .dark)
            }
            
            VStack {
                HStack {
                    Text("🐥")
                        .font(.system(size: 32))
                    
                    VStack {
                        Text("Level 1")
                            .font(.montserrat(size: 14, weight: "Medium"))
                        
                        RoundedRectangle(cornerRadius: 64)
                            .foregroundColor(colorScheme == .light ? .white : .black)
                            .frame(width: 128, height: 6)
                            .padding(2)
                            .background(
                                RoundedRectangle(cornerRadius: 64)
                                    .foregroundColor(Color(.systemGray4))
                            )
                        
                        Text("5 of 20")
                            .font(.montserrat(size: 12, weight: "Regular"))
                            .foregroundColor(Color(.systemGray))
                    }
                    
                    Text("🐹")
                        .font(.system(size: 32))
                }
                
                HStack(spacing: 24) {
                    ForEach(0 ..< 3) { item in
                        VStack {
                            Circle()
                                .frame(width: 48, height: 48)
                                .foregroundColor(.yellow)
                            
                            Text("Newbie")
                                .font(.montserrat(size: 16, weight: "Medium"))
                        }
                    }
                    
                    
                    Button {
                        withAnimation {
                            
                        }
                    } label: {
                        VStack {
                            ZStack {
                                Circle()
                                    .frame(width: 48, height: 48)
                                    .foregroundColor(Color(.systemGray5))
                                
                                Image(colorScheme == .light ? "Add" : "Addb")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 16)
                            }
                            
                            Button {
                                withAnimation {
                                    isRewards = true
                                }
                            } label: {
                                Text("5 more")
                                    .font(.montserrat(size: 16, weight: "Medium"))
                                    .foregroundColor(colorScheme == .light ? .black : .white)
                            }
                            .sheet(isPresented: $isRewards) {
                                VStack {
                                    
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
