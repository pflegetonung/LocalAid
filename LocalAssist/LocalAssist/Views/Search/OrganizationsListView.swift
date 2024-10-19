//
//  OrganizationsListView.swift
//  LocalAssist
//
//  Created by Phillip on 19.10.2024.
//

import SwiftUI

struct OrganizationsListView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @ObservedObject var organizationViewModel = OrganizationViewModel()
    
    var body: some View {
        VStack {
            ForEach(organizationViewModel.organizations) { organization in
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
                        Text(organization.name)
                            .font(.montserrat(size: 18, weight: "Medium"))
                            .foregroundColor(colorScheme == .light ? .black : .white)
                            .padding(.top)
                        
                        HStack {
                            Text(organization.username)
                                .lineLimit(1)
                                .font(.montserrat(size: 14, weight: "Bold"))
                                .foregroundColor(Color(.systemGray))
                                .padding(.bottom, 4)
                            
                            Spacer()
                            
//                            if organization.events.count != nil {
//                                Text("")
//                                    .font(.montserrat(size: 14, weight: "Regular"))
//                                    .foregroundColor(Color(.systemGray2))
//                            }
                        }
                    }
                }
                .padding(.vertical, 8)
            }
        }
        .onAppear {
            organizationViewModel.fetchOrganizations()
        }
    }
}

#Preview {
    OrganizationsListView()
}
