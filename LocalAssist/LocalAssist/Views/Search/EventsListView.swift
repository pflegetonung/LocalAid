//
//  EventsListView.swift
//  LocalAssist
//
//  Created by Phillip on 19.10.2024.
//

import SwiftUI

struct EventsListView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @ObservedObject var eventViewModel = EventViewModel()
    
    @State private var selectedEvent: Event?
    
    var body: some View {
        ZStack {
            VStack {
                ForEach(eventViewModel.events) { event in
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
                    .padding(.bottom, 16)
                }
                .onAppear {
                    eventViewModel.fetchEvents()
                }
            }
        }
    }
}

#Preview {
    EventsListView()
}
