//
//  TabBar.swift
//  LocalAssist
//
//  Created by Phillip on 21.10.2024.
//

import SwiftUI

struct TabBarView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationStack {
            Text("Hello, world!")
                .toolbar {
                    ToolbarItemGroup(placement: .bottomBar) {
                        HStack {
                            if colorScheme == .light {
                                Image(systemName: "square.and.arrow.up")
                                    .padding(8)
                                    .background(
                                        CustomBlur.Blur(style: .extraLight)
                                    )
                                    .clipShape(Circle())
                            } else {
                                Image(systemName: "square.and.arrow.up")
                                    .padding(8)
                                    .background(
                                        CustomBlur.Blur(style: .dark)
                                    )
                                    .clipShape(Circle())
                            }
                            
                            Spacer()
                            
                            if colorScheme == .light {
                                HStack {
                                    Image(systemName: "heart")
                                    
                                    Image(systemName: "info.circle")
                                        .padding(.horizontal)
                                    
                                    Image(systemName: "slider.horizontal.3")
                                }
                                .padding(8)
                                .padding(.horizontal, 4)
                                .background(
                                    CustomBlur.Blur(style: .extraLight)
                                )
                                .clipShape(Capsule())
                            } else {
                                HStack {
                                    Image(systemName: "heart")
                                    
                                    Image(systemName: "info.circle")
                                        .padding(.horizontal)
                                    
                                    Image(systemName: "slider.horizontal.3")
                                }
                                .padding(8)
                                .padding(.horizontal, 4)
                                .background(
                                    CustomBlur.Blur(style: .dark)
                                )
                                .clipShape(Capsule())
                            }
                            
                            Spacer()
                            
                            if colorScheme == .light {
                                Image(systemName: "trash")
                                    .padding(8)
                                    .background(
                                        CustomBlur.Blur(style: .extraLight)
                                    )
                                    .clipShape(Circle())
                            } else {
                                Image(systemName: "trash")
                                    .padding(8)
                                    .background(
                                        CustomBlur.Blur(style: .dark)
                                    )
                                    .clipShape(Circle())
                            }
                        }
                    }
                }
        }
    }
}

#Preview {
    TabBarView()
}
