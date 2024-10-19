//
//  NewEventView.swift
//  LocalAssist
//
//  Created by Phillip on 16.10.2024.
//

import SwiftUI

struct NewEventView: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.presentationMode) var presentationMode
    
    @State private var title: String = ""
    @State private var dateTimeInput: String = ""
    @State private var filterButton: Int = 0
    @State private var description: String = ""
    @State private var skills: String = ""
    @State private var phone: String = ""
    @State private var reward: String = ""
    
    var currentDateTime: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: Date())
    }
    let buttonTitles = [
        "Pets",
        "Elderly",
        "Children & Families",
        "Home & Household",
        "Food Assistance",
        "Medical & Health",
        "Community",
        "Disabled Assistance",
        "Environmental",
        "Education & Mentorship",
        "Emergencies & Crisis Support",
        "Miscellaneous"
    ]
    
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
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Event name *")
                            .font(.montserrat(size: 16, weight: "Bold"))
                        
                        TextField("e.g., “Grocery Delivery for Elderly Couple”", text: $title)
                            .font(.montserrat(size: 16, weight: "Regular"))
                            .padding(8)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundColor(colorScheme == .light ? .white : .black)
                                    .shadow(color: Color(.systemGray), radius: 1)
                            )
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Date and Time *")
                            .font(.montserrat(size: 16, weight: "Bold"))
                        
                        TextField("e.g., “\(currentDateTime)”", text: $dateTimeInput)
                            .font(.montserrat(size: 16, weight: "Regular"))
                            .padding(8)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundColor(colorScheme == .light ? .white : .black)
                                    .shadow(color: Color(.systemGray), radius: 1)
                            )
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Category *")
                            .font(.montserrat(size: 16, weight: "Bold"))
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: -8) {
                                ForEach(0 ..< buttonTitles.count) { item in
                                    Button {
                                        withAnimation {
                                            if filterButton == item + 1 {
                                                filterButton = 0
                                            } else {
                                                filterButton = item + 1
                                            }
                                        }
                                    } label: {
                                        if filterButton == item + 1 {
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
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Description *")
                            .font(.montserrat(size: 16, weight: "Bold"))
                        
                        TextField("A detailed explanation of the event, including what needs to be done, specific tasks, or how help is required (e.g., “Deliver groceries from the local store to a nearby address. The couple cannot go out due to health issues”).", text: $description,  axis: .vertical)
                            .lineLimit(7...10)
                            .font(.montserrat(size: 16, weight: "Regular"))
                            .padding(8)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundColor(colorScheme == .light ? .white : .black)
                                    .shadow(color: Color(.systemGray), radius: 1)
                            )
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Requirements or Skills Needed")
                            .font(.montserrat(size: 16, weight: "Bold"))
                        
                        TextField("If relevant, indicate how easy or difficult the task might be (e.g., “Easy – no special skills required” or “Moderate – some lifting involved”). Any specific qualifications or tools required to complete the task (e.g., “Must have a car for grocery pickup” or “Experience with elderly care preferred”).", text: $skills,  axis: .vertical)
                            .lineLimit(8...10)
                            .font(.montserrat(size: 16, weight: "Regular"))
                            .padding(8)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundColor(colorScheme == .light ? .white : .black)
                                    .shadow(color: Color(.systemGray), radius: 1)
                            )
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Contact information *")
                            .font(.montserrat(size: 16, weight: "Bold"))
                        
                        TextField("+1 123 456 78-90", text: $title)
                            .font(.montserrat(size: 16, weight: "Regular"))
                            .padding(8)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundColor(colorScheme == .light ? .white : .black)
                                    .shadow(color: Color(.systemGray), radius: 1)
                            )
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Location *")
                            .font(.montserrat(size: 16, weight: "Bold"))
                        
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
                                    
                                    Text("Pin on Map")
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
                                    
                                    Text("Pin on Map")
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
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Picture")
                            .font(.montserrat(size: 16, weight: "Bold"))
                        
                        Button {
                            withAnimation {
                                
                            }
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundColor(colorScheme == .light ? .white : .black)
                                    .shadow(color: Color(.systemGray), radius: 1)
                                    .frame(height: 128)
                                
                                if colorScheme == .light {
                                    HStack {
                                        Image("Add")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 16)
                                        
                                        Text("Add")
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
                                        Image("Addb")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 16)
                                        
                                        Text("Add")
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
                        }
                    }
                    .padding(.bottom)
                    
                    VStack(alignment: .leading) {
                        Text("* - required field")
                            .font(.montserrat(size: 14, weight: "Regular"))
                            .foregroundColor(Color(.systemGray))
                        
                        Button {
                            withAnimation {
                                
                            }
                        } label: {
                            if colorScheme == .light {
                                ZStack {
                                    LinearGradient(colors: [.greenThemeTop, .greenThemeBottom], startPoint: .topLeading, endPoint: .bottomTrailing)
                                        .frame(height: 48)
                                        .cornerRadius(16)
                                    
                                    Text("Add new event")
                                        .font(.montserrat(size: 16, weight: "Regular"))
                                        .foregroundColor(.white)
                                }
                            } else {
                                ZStack {
                                    LinearGradient(colors: [.yellowThemeTop, .yellowThemeBottom], startPoint: .topLeading, endPoint: .bottomTrailing)
                                        .frame(height: 48)
                                        .cornerRadius(16)
                                    
                                    Text("Add new event")
                                        .font(.montserrat(size: 16, weight: "Regular"))
                                        .foregroundColor(.black)
                                }
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
    NewEventView()
}
