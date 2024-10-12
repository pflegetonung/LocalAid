//
//  FeedView.swift
//  LocalAssist
//
//  Created by Phillip on 12.10.2024.
//

import SwiftUI

struct FeedView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(sectionData) { item in
                        GeometryReader { geometry in
                            SectionView(section: item)
                                .rotation3DEffect(
                                    Angle(degrees: Double(geometry.frame(in: .global).minX - 30) / -20),
                                    axis: (x: 0.0, y: 10.0, z: 0.0)
                                )
                        }
                    }
                    .frame(width: 150, height: 150)
                }
            }
            .padding(.horizontal, -16)
            
            HStack {
                Text("Feed")
                    .font(.montserrat(size: 24, weight: "Bold"))
                
                Spacer()
                
                Button {
                    withAnimation {
                        
                    }
                } label: {
                    Image("Add")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 24)
                }
            }
            .padding(.top, 16)
            
            ForEach(0 ..< 5) { item in
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .frame(height: 200)
                            .foregroundColor(colorScheme == .dark ? .black : .white)
                        
                        VStack(alignment: .leading) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Eco-Harvest")
                                        .font(.montserrat(size: 22, weight: "Semibold"))
                                    
                                    
                                    Text("Fri, 10:00 AM - 12:00 PM")
                                        .font(.montserrat(size: 14, weight: "Regular"))
                                        .padding(.top, -16)
                                        .foregroundColor(Color(.systemGray2))
                                }
                                
                                Spacer()
                                
                                Image(systemName: "heart.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 32)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(.systemGray5))
                            }
                            
                            Text("Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo. Nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos")
                                .font(.montserrat(size: 16, weight: "Regular"))
                                .lineLimit(4)
                                .padding(.top, 4)
                            
                            Spacer()
                            
                            HStack {
                                Image("person")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 22)
                                    .cornerRadius(64)
                                    .shadow(color: Color(.systemGray), radius: 1)
                                    .padding(.trailing, 4)
                                
                                Text("National Park Service")
                                    .font(.montserrat(size: 14, weight: "Semibold"))
                                
                                Image("Verified")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 16)
                                    .padding(.leading, -4)
                                
                                Spacer()
                                
                                Text("5 min.")
                                    .font(.montserrat(size: 14, weight: "Regular"))
                                    .foregroundColor(Color(.systemGray2))
                            }
                        }
                        .padding()
                        
                        Text("Pets")
                            .fontWeight(.bold)
                            .padding(8)
                            .padding(.horizontal, 4)
                            .background(
                                ZStack(alignment: .top) {
                                    Rectangle()
                                        .foregroundColor(.accentColor)
                                        .frame(height: 16)
                                    
                                    CustomBlur.Blur(style: .light)
                                }
                            )
                            .cornerRadius(64)
                            .offset(x: -130, y: -100)
                    }
                    .padding(.top)
                }
            }
        }
    }
}

#Preview {
    ExploreView()
}

struct SectionView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var section: SectionCard
    var customWidth: CGFloat = 150
    var customHeight: CGFloat = 150
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(colorScheme == .dark ? Color.black : Color.white)
                .frame(width: customWidth, height: customHeight)
            
            HStack {
                VStack(alignment: .leading) {
                    Text(section.emoji)
                        .font(.title)
                    
                    Spacer()
                    
                    Text(section.title)
                        .font(.montserrat(size: 16, weight: "Regular"))
                }
                .padding()
                
                Spacer()
            }
        }
        .padding(.horizontal, 16)
    }
}

