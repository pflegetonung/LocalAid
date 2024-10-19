//
//  LogInScreenView.swift
//  LocalAssist
//
//  Created by Phillip on 06.10.2024.
//

import SwiftUI

struct LogInScreenView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @State private var sheet = true
    @State private var isSignInProcessing = false
    @State private var isSignUp = false
    @State private var isRestore = false
    
    var body: some View {
        ZStack(alignment: .top) {
            Image(colorScheme == .light ? "bga" : "bgb")
                .resizable()
                .ignoresSafeArea()
                .scaledToFit()
                .blur(radius: 5, opaque: true)
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                Button {
                    withAnimation {
                        
                    }
                } label: {
                    if colorScheme == .light {
                        HStack {
                            Image("Left")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 18)
                            
                            Text("Back")
                                .font(.montserrat(size: 16, weight: "Regular"))
                                .foregroundColor(.black)
                        }
                        .fontWeight(.bold)
                        .padding(8)
                        .padding(.horizontal, 4)
                        .background(
                            CustomBlur.Blur(style: .extraLight)
                        )
                        .cornerRadius(64)
                        .shadow(color: Color(.systemGray), radius: 1)
                    } else {
                        HStack {
                            Image("Leftb")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 18)
                            
                            Text("Back")
                                .foregroundColor(.white)
                                .font(.montserrat(size: 16, weight: "Regular"))
                        }
                        .fontWeight(.bold)
                        .padding(8)
                        .padding(.horizontal, 4)
                        .background(
                            CustomBlur.Blur(style: .dark)
                        )
                        .cornerRadius(64)
                        .shadow(color: Color(.systemGray), radius: 1)
                    }
                }
                .padding()
                
                Spacer()
                
                Text("Get Started Now!")
                    .foregroundColor(colorScheme == .light ? .black : .white)
                    .font(.montserrat(size: 32, weight: "Bold"))
                    .padding()
                    .padding(.top, 64)
                
                Text("Create an account or login to your account")
                    .font(.montserrat(size: 16, weight: "Regular"))
                    .foregroundColor(colorScheme == .light ? .black : .white)
                    .padding(.horizontal)
                    .padding(.bottom, 64)
            }
        }
        .sheet(isPresented: $sheet) {
            ZStack {
                VStack(spacing: 24) {
                    Text("Sign In")
                        .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                        .font(.montserrat(size: 24, weight: "Bold"))
                        .padding(.top)
                    
                    HStack {
                        Text("Don't have an account?")
                            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                            .font(.montserrat(size: 16, weight: "Regular"))
                        
                        Button {
                            withAnimation {
                                isSignUp = true
                            }
                        } label: {
                            Text("Sign Up")
                                .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                                .font(.montserrat(size: 16, weight: "Medium"))
                                .underline()
                        }
                        .sheet(isPresented: $isSignUp) {
                            SignUpView()
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
                    
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 16)
                            .foregroundStyle(colorScheme == .dark ? Color(.systemGray6) : Color.white)
                            .frame(height: 96)
                            .shadow(color: Color(.systemGray), radius: 1)
                        
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(Color(.systemGray)
                                .opacity(0.5))
                        
                        VStack(alignment: .leading, spacing: 28) {
                            HStack {
                                Image(systemName: "envelope")
                                    .foregroundColor(colorScheme == .light ? .black : .white)
                                    .frame(width: 32)
                                
                                Text("Email")
                                    .foregroundColor(Color(.systemGray)
                                        .opacity(0.5))
                                    .font(.montserrat(size: 16, weight: "Regular"))
                            }
                            
                            HStack {
                                Image(systemName: "lock.shield")
                                    .foregroundColor(colorScheme == .light ? .black : .white)
                                    .frame(width: 32)
                                
                                Text("Password")
                                    .foregroundColor(Color(.systemGray)
                                        .opacity(0.5))
                                    .font(.montserrat(size: 16, weight: "Regular"))
                                
                                Spacer()
                                
                                Image(systemName: "eye.slash")
                                    .foregroundColor(Color(.systemGray)
                                        .opacity(0.5))
                            }
                        }
                        .padding()
                        .foregroundColor(.black)
                    }
                    
                    Button {
                        withAnimation {
                            isRestore = true
                        }
                    } label: {
                        Text("Forgot Your Password?")
                            .foregroundColor(colorScheme == .light ? .black : .white)
                            .font(.montserrat(size: 16, weight: "Regular"))
                            .underline()
                    }
                    .sheet(isPresented: $isRestore) {
                        RestorePasswordView()
                            .presentationDetents([.fraction(0.4)])
                    }
                    
                    HStack(spacing: 16) {
                        Button {
                            withAnimation {
                                
                            }
                        } label: {
                            if colorScheme == .light {
                                ZStack {
                                    LinearGradient(colors: [.greenThemeTop, .greenThemeBottom], startPoint: .topLeading, endPoint: .bottomTrailing)
                                        .frame(height: 48)
                                        .cornerRadius(16)
                                    
                                    Text("Log In")
                                        .font(.montserrat(size: 16, weight: "Regular"))
                                        .foregroundColor(.white)
                                }
                            } else {
                                ZStack {
                                    LinearGradient(colors: [.yellowThemeTop, .yellowThemeBottom], startPoint: .topLeading, endPoint: .bottomTrailing)
                                        .frame(height: 48)
                                        .cornerRadius(16)
                                    
                                    Text("Log In")
                                        .font(.montserrat(size: 16, weight: "Regular"))
                                        .foregroundColor(.black)
                                }
                            }
                        }
                        
                        Button {
                            withAnimation {
                                
                            }
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 16)
                                    .frame(width: 48, height: 48)
                                    .foregroundColor(colorScheme == .dark ? Color(.systemGray6) : Color.white)
                                    .shadow(color: Color(.systemGray), radius: 1)
                                
                                Image("google")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 24)
                            }
                        }
                        
                        Button {
                            withAnimation {
                                
                            }
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 16)
                                    .frame(width: 48, height: 48)
                                    .foregroundColor(colorScheme == .dark ? Color(.systemGray6) : Color.white)
                                    .shadow(color: Color(.systemGray), radius: 1)
                                
                                Image(systemName: "apple.logo")
                                    .resizable()
                                    .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                                    .scaledToFit()
                                    .frame(height: 24)
                            }
                        }
                    }
                    .padding(.top)
                }
                .padding()
            }
            .ignoresSafeArea()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .presentationDetents([.height(380)])
            .presentationCornerRadius(32)
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
}

#Preview {
    LogInScreenView()
}

struct SignUpView: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 24) {
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
                                .frame(height: 24)
                                .padding(8)
                                .background(
                                    CustomBlur.Blur(style: .extraLight)
                                        .cornerRadius(64)
                                )
                        } else {
                            Image("Closeb")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 24)
                                .padding(8)
                                .background(
                                    CustomBlur.Blur(style: .dark)
                                        .cornerRadius(64)
                                )
                        }
                    }
                    
                    Spacer()
                }
                
                Text("Sign In")
                    .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                    .font(.system(size: 24, weight: .bold))
                    .padding(.top)
                
                VStack(alignment: .leading, spacing: 24) {
                    Text("Name")
                        .foregroundColor(Color(.systemGray))
                        .font(.system(size: 12, weight: .bold))
                        .padding(.bottom, -16)
                        .padding(.leading)
                    
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 16)
                            .foregroundStyle(colorScheme == .dark ? Color(.systemGray6) : Color.white)
                            .frame(height: 48)
                            .shadow(color: Color(.systemGray), radius: 1)
                        
                        Text("Alex")
                            .foregroundColor(Color(.systemGray)
                                .opacity(0.5))
                            .padding()
                    }
                    
                    Text("Username")
                        .foregroundColor(Color(.systemGray))
                        .font(.system(size: 12, weight: .bold))
                        .padding(.bottom, -16)
                        .padding(.leading)
                    
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 16)
                            .foregroundStyle(colorScheme == .dark ? Color(.systemGray6) : Color.white)
                            .frame(height: 48)
                            .shadow(color: Color(.systemGray), radius: 1)
                        
                        Text("@username")
                            .foregroundColor(Color(.systemGray)
                                .opacity(0.5))
                            .padding()
                    }
                    
                    Text("Email")
                        .foregroundColor(Color(.systemGray))
                        .font(.system(size: 12, weight: .bold))
                        .padding(.bottom, -16)
                        .padding(.leading)
                    
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 16)
                            .foregroundStyle(colorScheme == .dark ? Color(.systemGray6) : Color.white)
                            .frame(height: 48)
                            .shadow(color: Color(.systemGray), radius: 1)
                        
                        Text("address@mail.com")
                            .foregroundColor(Color(.systemGray)
                                .opacity(0.5))
                            .padding()
                    }
                    
                    Text("Phone Number")
                        .foregroundColor(Color(.systemGray))
                        .font(.system(size: 12, weight: .bold))
                        .padding(.bottom, -16)
                        .padding(.leading)
                    
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 16)
                            .foregroundStyle(colorScheme == .dark ? Color(.systemGray6) : Color.white)
                            .frame(height: 48)
                            .shadow(color: Color(.systemGray), radius: 1)
                        
                        Text("+1 (234) 567 89 00")
                            .foregroundColor(Color(.systemGray)
                                .opacity(0.5))
                            .padding()
                    }
                    
                    Text("Password")
                        .foregroundColor(Color(.systemGray))
                        .font(.system(size: 12, weight: .bold))
                        .padding(.bottom, -16)
                        .padding(.leading)
                    
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 16)
                            .foregroundStyle(colorScheme == .dark ? Color(.systemGray6) : Color.white)
                            .frame(height: 96)
                            .shadow(color: Color(.systemGray), radius: 1)
                        
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(Color(.systemGray)
                                .opacity(0.5))
                        
                        VStack(alignment: .leading, spacing: 28) {
                            Text("Enter Password")
                                .foregroundColor(Color(.systemGray)
                                    .opacity(0.5))
                            
                            Text("Confirm Password")
                                .foregroundColor(Color(.systemGray)
                                    .opacity(0.5))
                        }
                        .padding()
                        .foregroundColor(.black)
                    }
                    
                    Button {
                        withAnimation {
                            
                        }
                    } label: {
                        if colorScheme == .light {
                            ZStack {
                                LinearGradient(colors: [.greenThemeTop, .greenThemeBottom], startPoint: .topLeading, endPoint: .bottomTrailing)
                                    .frame(height: 48)
                                    .cornerRadius(16)
                                
                                Text("Sign In")
                                    .foregroundColor(.white)
                            }
                        } else {
                            ZStack {
                                LinearGradient(colors: [.yellowThemeTop, .yellowThemeBottom], startPoint: .topLeading, endPoint: .bottomTrailing)
                                    .frame(height: 48)
                                    .cornerRadius(16)
                                
                                Text("Sign In")
                                    .foregroundColor(.black)
                            }
                        }
                    }
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

struct RestorePasswordView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(spacing: 24) {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 48, height: 8)
                .foregroundColor(Color(.systemGray).opacity(0.5))
            
            Text("Restore Password")
                .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                .font(.system(size: 24, weight: .bold))
                .padding(.top)
            
            VStack(alignment: .leading, spacing: 24) {
                Text("Email")
                    .foregroundColor(Color(.systemGray))
                    .font(.system(size: 12, weight: .bold))
                    .padding(.bottom, -16)
                    .padding(.leading)
                
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundStyle(colorScheme == .dark ? Color(.systemGray6) : Color.white)
                        .frame(height: 48)
                        .shadow(color: Color(.systemGray), radius: 1)
                    
                    Text("address@mail.com")
                        .foregroundColor(Color(.systemGray)
                            .opacity(0.5))
                        .padding()
                }
            }
            
            Button {
                withAnimation {
                    
                }
            } label: {
                if colorScheme == .light {
                    ZStack {
                        LinearGradient(colors: [.greenThemeTop, .greenThemeBottom], startPoint: .topLeading, endPoint: .bottomTrailing)
                            .frame(height: 48)
                            .cornerRadius(16)
                        
                        Text("Restore")
                            .foregroundColor(.white)
                    }
                } else {
                    ZStack {
                        LinearGradient(colors: [.yellowThemeTop, .yellowThemeBottom], startPoint: .topLeading, endPoint: .bottomTrailing)
                            .frame(height: 48)
                            .cornerRadius(16)
                        
                        Text("Restore")
                            .foregroundColor(.black)
                    }
                }
            }
            
            Spacer()
        }
        .padding()
    }
}
