//
//  SearchView.swift
//  LocalAssist
//
//  Created by Phillip on 16.10.2024.
//

import SwiftUI

struct SearchView: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.presentationMode) var presentationMode
    
    @State private var page: Int = 1
    
    let buttonTitles = [
        "Events",
        "Users",
        "Organizations",
        "Community Groups"
    ]
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    HStack {
                        Button {
                            withAnimation {
                                self.presentationMode.wrappedValue.dismiss()
                            }
                        } label: {
                            if colorScheme == .light {
                                Image("Close")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 20)
                                    .padding(12)
                                    .background(
                                        CustomBlur.Blur(style: .extraLight)
                                            .cornerRadius(64)
                                    )
                            } else {
                                Image("Closeb")
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
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 64)
                                .frame(height: 48)
                                .foregroundColor(colorScheme == .dark ? .black : .white)
                            
                            HStack {
                                Image(colorScheme == .light ? "Search" : "Searchb")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 16, height: 16)
                                
                                Text("Search")
                                    .font(.montserrat(size: 16, weight: "Regular"))
                                    .foregroundColor(Color(.systemGray2))
                                
                                Spacer()
                            }
                            .padding(.horizontal)
                        }
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: -8) {
                            ForEach(0 ..< buttonTitles.count) { item in
                                Button {
                                    withAnimation {
                                        page = item + 1
                                    }
                                } label: {
                                    if page == item + 1 {
                                        if colorScheme == .light {
                                            Text(buttonTitles[item])
                                                .foregroundColor(.white)
                                                .fontWeight(.bold)
                                                .padding(8)
                                                .padding(.horizontal, 4)
                                                .background(
                                                    LinearGradient(colors: [.greenThemeTop, .greenThemeBottom], startPoint: .topLeading, endPoint: .bottomTrailing)
                                                )
                                                .cornerRadius(64)
                                                .padding(.horizontal)
                                        } else {
                                            Text(buttonTitles[item])
                                                .foregroundColor(.black)
                                                .fontWeight(.bold)
                                                .padding(8)
                                                .padding(.horizontal, 4)
                                                .background(
                                                    LinearGradient(colors: [.yellowThemeTop, .yellowThemeBottom], startPoint: .topLeading, endPoint: .bottomTrailing)
                                                )
                                                .cornerRadius(64)
                                                .padding(.horizontal)
                                        }
                                    } else if colorScheme == .light {
                                        Text(buttonTitles[item])
                                            .foregroundColor(.black)
                                            .fontWeight(.bold)
                                            .padding(8)
                                            .padding(.horizontal, 4)
                                            .background(
                                                CustomBlur.Blur(style: .extraLight)
                                            )
                                            .cornerRadius(64)
                                            .padding(.horizontal)
                                    } else {
                                        Text(buttonTitles[item])
                                            .foregroundColor(.white)
                                            .fontWeight(.bold)
                                            .padding(8)
                                            .padding(.horizontal, 4)
                                            .background(
                                                CustomBlur.Blur(style: .dark)
                                            )
                                            .cornerRadius(64)
                                            .padding(.horizontal)
                                    }
                                }
                            }
                        }
                    }
                    .padding(.horizontal, -16)
                    
                    Text(textOfPage(page))
                        .font(.montserrat(size: 24, weight: "Bold"))
                    
                    if page == 1 {
                        EventsListView()
                    } else if page == 2 {
                        UsersListView()
                    } else if page == 3 {
                        OrganizationsListView()
                    } else {
                        CommunityGroupsListView()
                    }
                }
                .padding()
            }
        }
    }
    
    func textOfPage(_ state: Int) -> String {
        switch state {
        case 1:
            return "Events"
        case 2:
            return "Users"
        case 3:
            return "Organizations"
        case 4:
            return "Community Groups"
        default:
            return "Unknown Page"
        }
    }
}

#Preview {
    SearchView()
}
