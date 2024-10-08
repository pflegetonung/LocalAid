//
//  HomeView.swift
//  LocalAssist
//
//  Created by Phillip on 06.10.2024.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @State private var isProfilePresented = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                HStack(spacing: 24) {
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(height: 32)
                            .foregroundColor(colorScheme == .dark ? Color.black : Color.white)
                            .shadow(color: Color(.systemGray), radius: 1)
                        
                        Button {
                            withAnimation {
                                
                            }
                        } label: {
                            HStack {
                                Text("Louisville, KE")
                                
                                Spacer()
                                
                                Image(systemName: "mappin")
                            }
                            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                            .padding(.horizontal)
                        }
                    }
                    
                    Button {
                        withAnimation {
                            isProfilePresented = true
                        }
                    } label: {
                        Image("profile")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(20)
                            .frame(width: 32, height: 32)
                            .shadow(color: Color(.systemGray), radius: 1)
                    }
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(sectionData) { item in
                            GeometryReader { geometry in
                                SectionView(section: item)
                                    .rotation3DEffect(
                                        Angle(degrees: Double(geometry.frame(in: .global).minX - 30) / -20),
                                        axis: (x: 0.0, y: 10.0, z: 0.0)
                                    )
                                    .padding(.leading, 16)
                            }
                        }
                        .frame(width: 200, height: 200)
                    }
                }
                .padding()
                .padding(.top, -24)
                .padding(.horizontal, -32)
                
                Text("Near You:")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
            }
            .sheet(isPresented: $isProfilePresented) {
                ProfileView()
            }
            .padding()
        }
    }
}

#Preview {
    HomeView()
}

struct SectionView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var section: SectionCard
    var customWidth: CGFloat = 200
    var customHeight: CGFloat = 150
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(colorScheme == .dark ? Color.black : Color.white)
                .shadow(color: Color(.systemGray), radius: 1)
                .frame(width: customWidth, height: customHeight)
            
            ZStack {
                VStack {
                    VStack {
                        HStack {
                            Text(section.title)
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                            
                            Spacer()
                        }
                    }
                    Text(section.description.uppercased())
                        .font(.system(size: 32, design: .rounded))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.white)
                }
                .padding(20)
                .background(.thinMaterial.opacity(0.2))
                .cornerRadius(20)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 50)
                        .frame(width: 64, height: 64)
                        .foregroundColor(.black)
                        .shadow(color: Color(.systemGray), radius: 1)
                    
                    Text(section.emoji)
                        .font(.system(size: 32))
                }
                .offset(x: 80, y: -54)
            }
        }
        .padding(.top, 24)
    }
}
