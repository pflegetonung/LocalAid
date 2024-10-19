//
//  UsersListView.swift
//  LocalAssist
//
//  Created by Phillip on 19.10.2024.
//

import SwiftUI

struct UsersListView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @ObservedObject var userViewModel = UserViewModel()
    
    var body: some View {
        VStack {
            ForEach(userViewModel.users) { user in
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
                        Text(user.name)
                            .font(.montserrat(size: 18, weight: "Medium"))
                            .foregroundColor(colorScheme == .light ? .black : .white)
                            .padding(.top)
                        
                        HStack {
                            Text(user.username)
                                .lineLimit(1)
                                .font(.montserrat(size: 14, weight: "Bold"))
                                .foregroundColor(Color(.systemGray))
                                .padding(.bottom, 4)
                            
                            Spacer()
                            
                            Text(user.status)
                                .font(.montserrat(size: 14, weight: "Regular"))
                                .foregroundColor(Color(.systemGray2))
                        }
                    }
                }
                .padding(.vertical, 8)
            }
        }
        .onAppear {
            userViewModel.fetchUsers()
        }
    }
}

#Preview {
    UsersListView()
}
