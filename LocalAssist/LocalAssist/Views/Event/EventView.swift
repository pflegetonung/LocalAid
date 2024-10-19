//
//  EventView.swift
//  LocalAssist
//
//  Created by Phillip on 15.10.2024.
//

import SwiftUI

struct EventView: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            ZStack {
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
                        
                        Spacer()
                        
                        Button {
                            withAnimation {
                                self.presentationMode.wrappedValue.dismiss()
                            }
                        } label: {
                            if colorScheme == .light {
                                Image(systemName: "heart.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 20)
                                    .foregroundColor(Color(.systemGray2))
                                    .padding(12)
                                    .background(
                                        CustomBlur.Blur(style: .extraLight)
                                            .cornerRadius(64)
                                    )
                            } else {
                                Image(systemName: "heart.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 20)
                                    .foregroundColor(Color(.systemGray2))
                                    .padding(12)
                                    .background(
                                        CustomBlur.Blur(style: .dark)
                                            .cornerRadius(64)
                                    )
                            }
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Name of the Event")
                                .font(.montserrat(size: 24, weight: "Bold"))
                            
                            Spacer()
                            
                            Text("(Archived)")
                                .font(.montserrat(size: 14, weight: "Regular"))
                                .foregroundColor(Color(.systemGray))
                        }
                        
                        Text("Tuesday, Oct 15, 2 pm to 4 pm")
                            .font(.montserrat(size: 14, weight: "Regular"))
                            .foregroundColor(Color(.systemGray))
                    }
                    
                    if colorScheme == .light {
                        Text("Pets")
                            .fontWeight(.bold)
                            .padding(8)
                            .padding(.horizontal, 4)
                            .background(
                                CustomBlur.Blur(style: .extraLight)
                            )
                            .cornerRadius(64)
                    } else {
                        Text("Pets")
                            .fontWeight(.bold)
                            .padding(8)
                            .padding(.horizontal, 4)
                            .background(
                                CustomBlur.Blur(style: .dark)
                            )
                            .cornerRadius(64)
                    }
                    
                    Text("A detailed explanation of the event, including what needs to be done, specific tasks, or how help is required (e.g., “Deliver groceries from the local store to a nearby address. The couple cannot go out due to health issues”).")
                        .font(.montserrat(size: 16, weight: "Regular"))
                    
                    VStack(alignment: .leading) {
                        Text("Required skills:")
                            .font(.montserrat(size: 16, weight: "Bold"))
                        
                        Text("If relevant, indicate how easy or difficult the task might be (e.g., “Easy – no special skills required” or “Moderate – some lifting involved”). Any specific qualifications or tools required to complete the task (e.g., “Must have a car for grocery pickup” or “Experience with elderly care preferred”).")
                            .font(.montserrat(size: 16, weight: "Regular"))
                    }
                    
                    Image("bga")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(8)
                    
                    Button {
                        withAnimation {
                            
                        }
                    } label: {
                        if colorScheme == .light {
                            HStack {
                                Image("Explore")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 16)
                                
                                Text("Location")
                                    .foregroundColor(.black)
                                    .font(.montserrat(size: 16, weight: "Semibold"))
                            }
                            .padding(8)
                            .padding(.horizontal, 4)
                            .background(
                                CustomBlur.Blur(style: .extraLight)
                            )
                            .cornerRadius(64)
                        } else {
                            HStack {
                                Image("Exploreb")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 16)
                                
                                Text("Location")
                                    .foregroundColor(.white)
                                    .font(.montserrat(size: 16, weight: "Semibold"))
                            }
                            .padding(8)
                            .padding(.horizontal, 4)
                            .background(
                                CustomBlur.Blur(style: .dark)
                            )
                            .cornerRadius(64)
                        }
                    }
                    
                    VStack(alignment: .leading) {
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
                            
                            Image(colorScheme == .light ? "Verified" : "Verifiedb")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 16)
                                .padding(.leading, -4)
                            
                            Spacer()
                        }
                        
                        Text("+1 999 255 65-54")
                            .font(.montserrat(size: 16, weight: "Regular"))
                            .foregroundColor(Color(.systemGray))
                    }
                    
                    Button {
                        withAnimation {
                            
                        }
                    } label: {
                        ZStack {
                            if colorScheme == .light {
                                LinearGradient(colors: [.greenThemeTop, .greenThemeBottom], startPoint: .topLeading, endPoint: .bottomTrailing)
                                    .frame(height: 48)
                                    .cornerRadius(16)
                            } else {
                                LinearGradient(colors: [.yellowThemeTop, .yellowThemeBottom], startPoint: .topLeading, endPoint: .bottomTrailing)
                                    .frame(height: 48)
                                    .cornerRadius(16)
                            }
                            
                            HStack {
                                Text("Join for")
                                    .font(.montserrat(size: 16, weight: "Regular"))
                                    .foregroundColor(colorScheme == .light ? .white : .black)
                                
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 24)
                                    .foregroundColor(.yellow)
                                    .shadow(color: .black, radius: 1)
                                
                                Text("50")
                                    .font(.montserrat(size: 16, weight: "Regular"))
                                    .foregroundColor(colorScheme == .light ? .white : .black)
                            }
                        }
                    }
                }
                .padding(.bottom)
            }
            .padding()
        }
    }
}

#Preview {
    EventView()
}
