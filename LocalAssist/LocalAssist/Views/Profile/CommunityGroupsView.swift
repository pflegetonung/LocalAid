//
//  CommunityGroupsView.swift
//  LocalAssist
//
//  Created by Phillip on 16.10.2024.
//

import SwiftUI

struct CommunityGroupsView: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.presentationMode) var presentationMode
    
    @State private var isFollowers = false
    
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                VStack {
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
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Group Name")
                                .font(.montserrat(size: 24, weight: "Bold"))
                                .foregroundColor(colorScheme == .light ? .black : .white)
                            
                            Text("@somegroup")
                                .font(.montserrat(size: 16, weight: "Bold"))
                                .foregroundColor(Color(.systemGray))
                                .padding(.bottom, 4)
                            
                            HStack {
                                Text("572 followers")
                                    .font(.montserrat(size: 14, weight: "Regular"))
                                
                                Spacer()
                                
                                ZStack {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 64)
                                            .frame(width: 20, height: 20)
                                            .foregroundColor(colorScheme == .light ? .white :  .black)
                                        
                                        RoundedRectangle(cornerRadius: 64)
                                            .frame(width: 16, height: 16)
                                            .foregroundColor(Color(.systemGray))
                                    }
                                    .offset(x: -20)
                                    
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 64)
                                            .frame(width: 20, height: 20)
                                            .foregroundColor(colorScheme == .light ? .white :  .black)
                                        
                                        RoundedRectangle(cornerRadius: 64)
                                            .frame(width: 16, height: 16)
                                            .foregroundColor(Color(.systemGray))
                                    }
                                    .offset(x: -10)
                                    
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 64)
                                            .frame(width: 20, height: 20)
                                            .foregroundColor(colorScheme == .light ? .white :  .black)
                                        
                                        RoundedRectangle(cornerRadius: 64)
                                            .frame(width: 16, height: 16)
                                            .foregroundColor(Color(.systemGray))
                                    }
                                }
                            }
                            
                            HStack {
                                Text("12 members")
                                    .font(.montserrat(size: 14, weight: "Regular"))
                                
                                Spacer()
                                
                                ZStack {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 64)
                                            .frame(width: 20, height: 20)
                                            .foregroundColor(colorScheme == .light ? .white :  .black)
                                        
                                        RoundedRectangle(cornerRadius: 64)
                                            .frame(width: 16, height: 16)
                                            .foregroundColor(Color(.systemGray))
                                    }
                                    .offset(x: -20)
                                    
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 64)
                                            .frame(width: 20, height: 20)
                                            .foregroundColor(colorScheme == .light ? .white :  .black)
                                        
                                        RoundedRectangle(cornerRadius: 64)
                                            .frame(width: 16, height: 16)
                                            .foregroundColor(Color(.systemGray))
                                    }
                                    .offset(x: -10)
                                    
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 64)
                                            .frame(width: 20, height: 20)
                                            .foregroundColor(colorScheme == .light ? .white :  .black)
                                        
                                        RoundedRectangle(cornerRadius: 64)
                                            .frame(width: 16, height: 16)
                                            .foregroundColor(Color(.systemGray))
                                    }
                                }
                            }
                        }
                        .padding(.leading, 8)
                        
                        Spacer()
                    }
                    
                    HStack {
                        Button {
                            withAnimation {
                                
                            }
                        } label: {
                            ZStack {
                                if colorScheme == .light {
                                    CustomBlur.Blur(style: .light)
                                        .cornerRadius(16)
                                        .frame(width: 48, height: 48)
                                } else {
                                    CustomBlur.Blur(style: .dark)
                                        .cornerRadius(16)
                                        .frame(width: 48, height: 48)
                                }
                                
                                Image(colorScheme == .light ? "Add" : "Addb")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24)
                            }
                        }
                        
                        Button {
                            withAnimation {
                                
                            }
                        } label: {
                            if colorScheme == .light {
                                ZStack {
                                    LinearGradient(colors: [.greenThemeTop, .greenThemeBottom], startPoint: .topLeading, endPoint: .bottomTrailing)
                                        .frame(height: 48)
                                        .cornerRadius(16)
                                    
                                    Text("Follow")
                                        .font(.montserrat(size: 16, weight: "Regular"))
                                        .foregroundColor(.white)
                                }
                            } else {
                                ZStack {
                                    LinearGradient(colors: [.yellowThemeTop, .yellowThemeBottom], startPoint: .topLeading, endPoint: .bottomTrailing)
                                        .frame(height: 48)
                                        .cornerRadius(16)
                                    
                                    Text("Follow")
                                        .font(.montserrat(size: 16, weight: "Regular"))
                                        .foregroundColor(.black)
                                }
                            }
                        }
                    }
                    .padding(.vertical)
                    
                    if isFollowers {
                        FollowersListView()
                    } else {
                        PostsListView()
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    CommunityGroupsView()
}

struct FollowersListView: View {
    var body: some View {
        ZStack {
            
        }
    }
}

struct PostsListView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @State private var isArchive = false
    
    var body: some View {
        ZStack {
            VStack {
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
                
                if colorScheme == .light {
                    Text("There's no posts yet")
                        .foregroundColor(.black)
                        .font(.montserrat(size: 16, weight: "Regular"))
                        .padding(8)
                        .padding(.horizontal, 4)
                        .background(
                            CustomBlur.Blur(style: .extraLight)
                        )
                        .cornerRadius(64)
                        .shadow(color: Color(.systemGray), radius: 1)
                        .padding(.top, 64)
                } else {
                    Text("There's no posts yet")
                        .foregroundColor(.white)
                        .font(.montserrat(size: 16, weight: "Regular"))
                        .padding(8)
                        .padding(.horizontal, 4)
                        .background(
                            CustomBlur.Blur(style: .dark)
                        )
                        .cornerRadius(64)
                        .shadow(color: Color(.systemGray), radius: 1)
                        .padding(.top, 64)
                }
            }
        }
    }
}
