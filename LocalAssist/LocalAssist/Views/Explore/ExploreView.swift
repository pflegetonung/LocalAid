//
//  ExploreView.swift
//  LocalAssist
//
//  Created by Phillip on 12.10.2024.
//

import SwiftUI
import MapKit

struct ExploreView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @EnvironmentObject var locationManager: LocationManager
    
    @State private var sheet = true
    @State private var profileSheet = false
    @State private var isSearchSheet = false
    @State private var isFavs = false
    @State private var isFilter = false
    @State private var filterButton: Int = 0
    
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
        ZStack(alignment: .bottomLeading) {
            if let location = locationManager.location {
                Map(coordinateRegion: $locationManager.region, showsUserLocation: true)
                    .blur(radius: profileSheet == true ? 5 : 0, opaque: true)
                    .ignoresSafeArea()
            } else {
                ZStack {
                    Image(colorScheme == .light ? "bga" : "bgb")
                        .resizable()
                        .ignoresSafeArea()
                        .scaledToFit()
                        .blur(radius: 5, opaque: true)
                    
                    VStack {
                        Spacer()
                        
                        HStack {
                            Spacer()
                            
                            Button {
                                withAnimation {
                                    openAppSettings()
                                }
                            } label: {
                                Text("Turn on location services")
                                    .foregroundColor(.white)
                                    .font(.montserrat(size: 16, weight: "Semibold"))
                                    .padding(.horizontal)
                                    .background(
                                        RoundedRectangle(cornerRadius: 16)
                                            .frame(height: 48)
                                            .foregroundColor(.red)
                                    )
                            }
                            
                            Spacer()
                        }
                        
                        Spacer()
                        
                        Rectangle()
                            .frame(height: 256)
                            .foregroundColor(.clear)
                    }
                }
                .ignoresSafeArea()
            }
            
            VStack {
                if colorScheme == .light {
                    CustomBlur.Blur(style: .light)
                        .mask {
                            LinearGradient(colors: [Color.black.opacity(1), Color.black.opacity(0.8), Color.black.opacity(0)], startPoint: .top, endPoint: .bottom)
                        }
                        .frame(height: 90)
                } else {
                    CustomBlur.Blur(style: .dark)
                        .mask {
                            LinearGradient(colors: [Color.black.opacity(1), Color.black.opacity(0.8), Color.black.opacity(0)], startPoint: .top, endPoint: .bottom)
                        }
                        .frame(height: 90)
                }
                
                Button {
                    withAnimation {
                        centerMapOnUserLocation()
                    }
                } label: {
                    if colorScheme == .light {
                        HStack {
                            Text("Anchored to: ")
                                .foregroundColor(.black)
                                .font(.montserrat(size: 16, weight: "Regular"))
                            
                            Text("Eco event")
                                .foregroundColor(.black)
                                .font(.montserrat(size: 16, weight: "Bold"))
                        }
                        .padding(8)
                        .padding(.horizontal, 4)
                        .background(
                            CustomBlur.Blur(style: .extraLight)
                        )
                        .cornerRadius(64)
                        .shadow(color: Color(.systemGray), radius: 1)
                    } else {
                        HStack {
                            Text("Anchored to: ")
                                .foregroundColor(.white)
                                .font(.montserrat(size: 16, weight: "Regular"))
                            
                            Text("Eco event")
                                .foregroundColor(.white)
                                .font(.montserrat(size: 16, weight: "Bold"))
                        }
                        .padding(8)
                        .padding(.horizontal, 4)
                        .background(
                            CustomBlur.Blur(style: .dark)
                        )
                        .cornerRadius(64)
                        .shadow(color: Color(.systemGray), radius: 1)
                    }
                }
                
                Spacer()
            }
            .ignoresSafeArea()
            
            VStack {
                VStack {
                    HStack {
                        Button {
                            withAnimation {
                                centerMapOnUserLocation()
                            }
                        } label: {
                            if colorScheme == .light {
                                HStack {
                                    Image("Explore")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 16)
                                    
                                    Text(locationManager.cityName)
                                        .foregroundColor(.black)
                                        .font(.montserrat(size: 16, weight: "Semibold"))
                                }
                                .padding(8)
                                .padding(.horizontal, 4)
                                .background(
                                    CustomBlur.Blur(style: .extraLight)
                                )
                                .cornerRadius(64)
                                .shadow(color: Color(.systemGray), radius: 1)
                            } else {
                                HStack {
                                    Image("Exploreb")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 16)
                                    
                                    Text(locationManager.cityName)
                                        .foregroundColor(.white)
                                        .font(.montserrat(size: 16, weight: "Semibold"))
                                }
                                .padding(8)
                                .padding(.horizontal, 4)
                                .background(
                                    CustomBlur.Blur(style: .dark)
                                )
                                .cornerRadius(64)
                                .shadow(color: Color(.systemGray), radius: 1)
                            }
                        }
                        
                        Spacer()
                        
                        Button {
                            withAnimation {
                                profileSheet = true
                            }
                        } label: {
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
                                        .frame(height: 16)
                                }
                                
//                                Image("person")
//                                    .resizable()
//                                    .scaledToFit()
//                                    .shadow(color: Color(.systemGray2), radius: 1)
                            }
                            .frame(width: 34, height: 34)
                            .cornerRadius(64)
                            .shadow(color: Color(.systemGray), radius: 1)
                        }
                        .sheet(isPresented: $profileSheet) {
                            VStack {
                                ChatView()
                            }
                            .presentationDetents([.height(600), .large])
                            .presentationCornerRadius(32)
                            .presentationBackground(content: {
                                if colorScheme == .light {
                                    CustomBlur.Blur(style: .extraLight)
                                } else {
                                    CustomBlur.Blur(style: .dark)
                                }
                            })
                        }
                    }
                    .opacity(profileSheet == true ? 0.0 : 1.0)
                    .padding()
                }
                
                Rectangle()
                    .frame(height: 290)
                    .foregroundColor(.clear)
            }
        }
        .task {
            sheet = true
        }
        .sheet(isPresented: $sheet) {
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 24) {
                        HStack(spacing: 16) {
                            Button {
                                withAnimation {
                                    isSearchSheet = true
                                }
                            } label: {
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
                            .sheet(isPresented: $isSearchSheet) {
                                SearchView()
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
                            
                            Button {
                                withAnimation {
                                    isFilter.toggle()
                                    
                                    isFavs = false
                                }
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 64)
                                        .frame(width: 48, height: 48)
                                        .foregroundColor(colorScheme == .dark ? .black : .white)
                                    
                                    Image((colorScheme == .light ? "Filter" : "Filterb"))
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 20, height: 20)
                                }
                            }
                        }
                        
                        VStack(spacing: 4) {
                            if isFilter {
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
                            } else {
                                HStack(spacing: 8) {
                                    Spacer()
                                    
                                    Button {
                                        withAnimation {
                                            isFavs = false
                                        }
                                    } label: {
                                        Text("Explore")
                                            .font(.montserrat(size: 20, weight: "Bold"))
                                            .foregroundColor(isFavs ? Color(.systemGray2) : (colorScheme == .dark ? .white : .black))
                                    }
                                    
                                    Button {
                                        withAnimation {
                                            isFavs = true
                                        }
                                    } label: {
                                        Text("Favorites")
                                            .font(.montserrat(size: 20, weight: "Bold"))
                                            .foregroundColor(isFavs ? (colorScheme == .dark ? .white : .black) : Color(.systemGray2))
                                    }
                                    
                                    Spacer()
                                }
                            }
                        }
                        
                        if isFavs {
                            FavoritesView()
                        } else {
                            FeedView()
                        }
                    }
                    .padding()
                    .padding(2)
                    .padding(.bottom, 32)
                }
                .ignoresSafeArea()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .presentationDetents([.height(290), .large])
                .presentationCornerRadius(32)
                .presentationBackgroundInteraction(.enabled(upThrough: .large))
                .presentationBackground(content: {
                    if colorScheme == .light {
                        CustomBlur.Blur(style: .extraLight)
                    } else {
                        CustomBlur.Blur(style: .dark)
                    }
                })
                .interactiveDismissDisabled()
                .ignoresSafeArea()
        }
    }
    
    private func centerMapOnUserLocation() {
        if let location = locationManager.location {
            let offsetLatitude = location.coordinate.latitude - 0.0035
            
            locationManager.region = MKCoordinateRegion(center: CLLocationCoordinate2D(
                latitude: offsetLatitude,
                longitude: location.coordinate.longitude),
                latitudinalMeters: 1200,
                longitudinalMeters: 1200
            )
        }
    }
    
    private func openAppSettings() {
        if let appSettings = URL(string: UIApplication.openSettingsURLString) {
            if UIApplication.shared.canOpenURL(appSettings) {
                UIApplication.shared.open(appSettings)
            }
        }
    }
}

#Preview {
    ExploreView()
        .environmentObject(LocationManager())
}

struct MapViewRepresentable: UIViewRepresentable {
    let coordinate: CLLocationCoordinate2D
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        let region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
        mapView.setRegion(region, animated: true)
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {  }
}
