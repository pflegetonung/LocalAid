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
    
    @State private var searchText = ""
    @State private var isSearching = false
    @State private var searchResults: [MKMapItem] = []
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749 - 0.035,
                                       longitude: -122.4194),
        span: MKCoordinateSpan(latitudeDelta: 0.15,
                               longitudeDelta: 0.15)
    )
    @State var sheet = true
    @State var locationSheet = false
    @State var profileSheet = false

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Map(coordinateRegion: $region)
                .blur(radius: locationSheet || profileSheet == true ? 5 : 0, opaque: true)
                .ignoresSafeArea()
            
            VStack {
                if colorScheme == .light {
                    CustomBlur.Blur(style: .light)
                        .mask {
                            VStack(spacing: 0) {
                                Rectangle()
                                
                                LinearGradient(
                                    colors: [
                                        Color.black.opacity(1),
                                        Color.black.opacity(0),
                                    ],
                                    startPoint: .top, // Swapped to top
                                    endPoint: .bottom // Swapped to bottom
                                )
                            }
                        }
                        .frame(height: 90)
                } else {
                    CustomBlur.Blur(style: .dark)
                        .mask {
                            VStack(spacing: 0) {
                                Rectangle()
                                
                                LinearGradient(
                                    colors: [
                                        Color.black.opacity(1),
                                        Color.black.opacity(0),
                                    ],
                                    startPoint: .top, // Swapped to top
                                    endPoint: .bottom // Swapped to bottom
                                )
                            }
                        }
                        .frame(height: 90)
                }
                
                Spacer()
            }
            .ignoresSafeArea()
            
            VStack {
                VStack {
                    HStack {
                        Button {
                            withAnimation {
                                locationSheet = true
                            }
                        } label: {
                            if colorScheme == .light {
                                HStack {
                                    Image("Explore")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 16)
                                    
                                    Text("San Francisco")
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
                                    Image("San Francisco")
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
                        .sheet(isPresented: $locationSheet) {
                            VStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 64)
                                        .frame(height: 44)
                                        .foregroundColor(colorScheme == .dark ? .black : .white)
                                        .shadow(color: Color(.systemGray), radius: 1)
                                    
                                    HStack {
                                        Image("Search")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 16, height: 16)
                                        
                                        TextField("Search for a location", text: $searchText, onEditingChanged: { _ in
                                            searchForLocation(named: searchText)
                                        })
                                        .font(.montserrat(size: 16, weight: "Regular"))
                                        .foregroundColor(Color(.systemGray2))
                                    }
                                    .padding(.horizontal)
                                }
                                
                                if !searchResults.isEmpty {
                                    List(searchResults, id: \.self) { result in
                                        Button(action: {
                                            if let coordinate = result.placemark.location?.coordinate {
                                                updateMapRegion(to: coordinate)
                                            }
                                        }) {
                                            VStack(alignment: .leading) {
                                                Text(result.name ?? "Unknown Place")
                                                    .font(.headline)
                                                Text("\(result.placemark.subAdministrativeArea ?? "Unknown County"), \(result.placemark.administrativeArea ?? "Unknown State")")
                                                    .font(.subheadline)
                                                    .foregroundColor(.gray)
                                            }
                                        }
                                    }
                                }
                            }
                            .padding()
                            .presentationDetents([.height(400), .large])
                            .presentationCornerRadius(32)
                            .presentationBackground(content: {
                                if colorScheme == .light {
                                    CustomBlur.Blur(style: .extraLight)
                                } else {
                                    CustomBlur.Blur(style: .dark)
                                }
                            })
                        }
                        
                        Spacer()
                        
                        Button {
                            withAnimation {
                                profileSheet = true
                            }
                        } label: {
                            Image("person")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 34)
                                .cornerRadius(64)
                                .shadow(color: Color(.systemGray2), radius: 1)
                        }
                        .sheet(isPresented: $profileSheet) {
                            VStack {
                                ProfileView()
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
                    .opacity(locationSheet || profileSheet == true ? 0.0 : 1.0)
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
                        ZStack {
                            RoundedRectangle(cornerRadius: 64)
                                .frame(height: 48)
                                .foregroundColor(colorScheme == .dark ? .black : .white)
                            
                            HStack {
                                Image("Search")
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
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 64)
                                .frame(width: 48, height: 48)
                                .foregroundColor(colorScheme == .dark ? .black : .white)
                            
                            Image("Filter")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                        }
                    }
                    
                    VStack(spacing: 4) {
                        HStack(spacing: 8) {
                            Spacer()
                            
                            Text("Explore")
                                .font(.montserrat(size: 20, weight: "Bold"))
                            
                            Text("Favorites")
                                .font(.montserrat(size: 20, weight: "Bold"))
                                .foregroundColor(Color(.systemGray2))
                            
                            Spacer()
                        }
                    }
                    
                    FeedView()
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
    
    private func searchForLocation(named location: String) {
        guard !location.isEmpty else {
            searchResults = []
            return
        }
        
        isSearching = true
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = location
        
        let search = MKLocalSearch(request: searchRequest)
        search.start { response, error in
            isSearching = false
            if let response = response {
                searchResults = response.mapItems
            } else {
                print("Error searching for location: \(error?.localizedDescription ?? "Unknown error")")
                searchResults = []
            }
        }
    }
    
    private func updateMapRegion(to coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
        searchResults = []
        searchText = ""
    }
}

#Preview {
    ExploreView()
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
