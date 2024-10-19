//
//  SettingsView.swift
//  LocalAssist
//
//  Created by Phillip on 15.10.2024.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @AppStorage(Constants.universalKey) var accentColor: String = "blue"
    
    @State private var chosenColor = 1
    
    var body: some View {
        VStack {
            if colorScheme == .light {
                HStack {
                    Spacer()
                    
                    Button {
                        withAnimation {
                            chosenColor = 1
                            
                            setAccentColor("green")
                        }
                    } label: {
                        VStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 64)
                                    .frame(width: 48, height: 48)
                                    .foregroundColor(Color(.systemGray5))
                                
                                RoundedRectangle(cornerRadius: 64)
                                    .frame(width: 42, height: 42)
                                    .foregroundColor(colorScheme == .light ? .white : .black)
                                
                                ZStack {
                                    LinearGradient(colors: [.greenThemeTop, .greenThemeBottom], startPoint: .topLeading, endPoint: .bottomTrailing)
                                    
                                    if chosenColor != 1 {
                                        if colorScheme == .light {
                                            CustomBlur.Blur(style: .extraLight)
                                        } else {
                                            CustomBlur.Blur(style: .dark)
                                        }
                                    }
                                }
                                .frame(width: 36, height: 36)
                                .cornerRadius(64)
                            }
                            
                            Text("Woods")
                                .font(.montserrat(size: 12, weight: "Medium"))
                                .foregroundColor(colorScheme == .light ? .black : .white)
                                .opacity(chosenColor != 1 ? 0.5 : 1.0)
                        }
                    }
                    
                    Spacer()
                    
                    Button {
                        withAnimation {
                            chosenColor = 2
                            
                            setAccentColor("blue")
                        }
                    } label: {
                        VStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 64)
                                    .frame(width: 48, height: 48)
                                    .foregroundColor(Color(.systemGray5))
                                
                                RoundedRectangle(cornerRadius: 64)
                                    .frame(width: 42, height: 42)
                                    .foregroundColor(colorScheme == .light ? .white : .black)
                                
                                ZStack {
                                    LinearGradient(colors: [.blueThemeTop, .blueThemeBottom], startPoint: .topLeading, endPoint: .bottomTrailing)
                                    
                                    if chosenColor != 2 {
                                        if colorScheme == .light {
                                            CustomBlur.Blur(style: .extraLight)
                                        } else {
                                            CustomBlur.Blur(style: .dark)
                                        }
                                    }
                                }
                                .frame(width: 36, height: 36)
                                .cornerRadius(64)
                            }
                            
                            Text("Night")
                                .font(.montserrat(size: 12, weight: "Medium"))
                                .foregroundColor(colorScheme == .light ? .black : .white)
                                .opacity(chosenColor != 2 ? 0.5 : 1.0)
                        }
                    }
                    
                    Spacer()
                }
                .accentColor(getColor())
                .padding()
            } else {
                HStack {
                    Spacer()
                    
                    Button {
                        withAnimation {
                            chosenColor = 1
                            
                            accentColor = "orange"
                        }
                    } label: {
                        VStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 64)
                                    .frame(width: 48, height: 48)
                                    .foregroundColor(Color(.systemGray5))
                                
                                RoundedRectangle(cornerRadius: 64)
                                    .frame(width: 42, height: 42)
                                    .foregroundColor(colorScheme == .light ? .white : .black)
                                
                                ZStack {
                                    LinearGradient(colors: [.yellowThemeTop, .yellowThemeBottom], startPoint: .topLeading, endPoint: .bottomTrailing)
                                    
                                    if chosenColor != 1 {
                                        if colorScheme == .light {
                                            CustomBlur.Blur(style: .extraLight)
                                        } else {
                                            CustomBlur.Blur(style: .dark)
                                        }
                                    }
                                }
                                .frame(width: 36, height: 36)
                                .cornerRadius(64)
                            }
                            
                            Text("Star")
                                .font(.montserrat(size: 12, weight: "Medium"))
                                .foregroundColor(colorScheme == .light ? .black : .white)
                                .opacity(chosenColor != 1 ? 0.5 : 1.0)
                        }
                    }
                    
                    Spacer()
                    
                    Button {
                        withAnimation {
                            chosenColor = 2
                            
                            accentColor = "red"
                        }
                    } label: {
                        VStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 64)
                                    .frame(width: 48, height: 48)
                                    .foregroundColor(Color(.systemGray5))
                                
                                RoundedRectangle(cornerRadius: 64)
                                    .frame(width: 42, height: 42)
                                    .foregroundColor(colorScheme == .light ? .white : .black)
                                
                                ZStack {
                                    LinearGradient(colors: [.purpleThemeTop, .purpleThemeBottom], startPoint: .topLeading, endPoint: .bottomTrailing)
                                    
                                    if chosenColor != 2 {
                                        if colorScheme == .light {
                                            CustomBlur.Blur(style: .extraLight)
                                        } else {
                                            CustomBlur.Blur(style: .dark)
                                        }
                                    }
                                }
                                .frame(width: 36, height: 36)
                                .cornerRadius(64)
                            }
                            
                            Text("Creativity")
                                .font(.montserrat(size: 12, weight: "Medium"))
                                .foregroundColor(colorScheme == .light ? .black : .white)
                                .opacity(chosenColor != 2 ? 0.5 : 1.0)
                        }
                    }
                    
                    Spacer()
                }
            }
            
            Spacer()
        }
        .padding()
        .padding(.top, 64)
    }
    
    func setAccentColor(_ color: String) {
        accentColor = color
    }

    func getColor() -> Color {
        return accentColor == "green" ? .green : .blue
    }
}

#Preview {
    SettingsView()
}
