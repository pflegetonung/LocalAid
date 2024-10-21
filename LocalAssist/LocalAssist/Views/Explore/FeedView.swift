//
//  FeedView.swift
//  LocalAssist
//
//  Created by Phillip on 12.10.2024.
//

import SwiftUI

struct FeedView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @ObservedObject var eventViewModel = EventViewModel()
    
    @State private var isEventSheet = false
    @State private var isNewEventSheet = false
    
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
                        isNewEventSheet = true
                    }
                } label: {
                    Image(colorScheme == .light ? "Add" : "Addb")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 24)
                }
            }
            .padding(.top, 16)
            
            ForEach(eventViewModel.events) { event in
                Button {
                    withAnimation {
                        isEventSheet = true
                    }
                } label: {
                    VStack {
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 16)
                                .frame(height: 200)
                                .foregroundColor(colorScheme == .dark ? .black : .white)
                            
                            VStack(alignment: .leading) {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(event.name)
                                            .font(.montserrat(size: 22, weight: "Semibold"))
                                            .foregroundColor(colorScheme == .light ? .black : .white)
                                        
                                        Text(event.address)
                                            .font(.montserrat(size: 14, weight: "Regular"))
                                            .padding(.top, -16)
                                            .foregroundColor(Color(.systemGray2))
                                        
                                        Text("DATE: REDO")
                                            .font(.montserrat(size: 14, weight: "Regular"))
                                            .padding(.top, -12)
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
                                
                                Text(event.description)
                                    .foregroundColor(colorScheme == .light ? .black : .white)
                                    .font(.montserrat(size: 16, weight: "Regular"))
                                    .lineLimit(4)
                                
                                Spacer()
                                
                                HStack {
                                    Image("person")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 22)
                                        .cornerRadius(64)
                                        .shadow(color: Color(.systemGray), radius: 1)
                                        .padding(.trailing, 4)
                                    
                                    Text(/*event.organizer ??*/ "")
                                        .lineLimit(1)
                                        .font(.montserrat(size: 14, weight: "Semibold"))
                                        .foregroundColor(colorScheme == .light ? .black : .white)
                                    
                                    Image(colorScheme == .light ? "Verified" : "Verifiedb")
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
                            
                            if colorScheme == .light {
                                Text(event.category)
                                    .foregroundColor(colorScheme == .light ? .black : .white)
                                    .font(.montserrat(size: 14, weight: "Bold"))
                                    .padding(4)
                                    .padding(.horizontal, 4)
                                    .background(
                                        CustomBlur.Blur(style: .extraLight)
                                    )
                                    .cornerRadius(64)
                                    .offset(y: -100)
                                    .padding(.leading, 16)
                            } else {
                                Text(event.category)
                                    .foregroundColor(colorScheme == .light ? .black : .white)
                                    .font(.montserrat(size: 14, weight: "Bold"))
                                    .padding(4)
                                    .padding(.horizontal, 4)
                                    .background(
                                        CustomBlur.Blur(style: .dark)
                                    )
                                    .cornerRadius(64)
                                    .offset(y: -100)
                                    .padding(.leading, 16)
                            }
                        }
                        .padding(.top)
                    }
                }
            }
            .onAppear {
                eventViewModel.fetchEvents()
            }
        }
        .sheet(isPresented: $isEventSheet) {
            EventView()
                .ignoresSafeArea()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .presentationCornerRadius(32)
                .presentationBackground(content: {
                    if colorScheme == .light {
                        CustomBlur.Blur(style: .extraLight)
                    } else {
                        CustomBlur.Blur(style: .dark)
                    }
                })
                .ignoresSafeArea()
        }
        .sheet(isPresented: $isNewEventSheet) {
            NewEventView()
                .ignoresSafeArea()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .presentationCornerRadius(32)
                .presentationBackground(content: {
                    if colorScheme == .light {
                        CustomBlur.Blur(style: .extraLight)
                    } else {
                        CustomBlur.Blur(style: .dark)
                    }
                })
                .ignoresSafeArea()
        }
    }
}

#Preview {
    FeedView()
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

