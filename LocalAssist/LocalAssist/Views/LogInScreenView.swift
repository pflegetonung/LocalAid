//
//  LogInScreenView.swift
//  LocalAssist
//
//  Created by Phillip on 06.10.2024.
//

import SwiftUI

struct LogInScreenView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @State private var isSignInProcessing = false
    @State private var isSignUp = false
    @State private var isRestore = false
    
    var body: some View {
        ZStack(alignment: .top) {
            Rectangle()
                .foregroundColor(.black)
                .ignoresSafeArea()
            
            Image("star")
                .resizable()
                .scaledToFit()
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                Button {
                    withAnimation {
                        
                    }
                } label: {
                    if colorScheme == .light {
                        HStack {
                            Image(systemName: "arrow.left")
                            
                            Text("Back")
                                .font(.montserrat(size: 16, weight: "Regular"))
                        }
                        .fontWeight(.bold)
                        .padding(8)
                        .padding(.horizontal, 4)
                        .background(
                            CustomBlur.Blur(style: .extraLight)
                        )
                        .cornerRadius(64)
                    } else {
                        HStack {
                            Image(systemName: "arrow.left")
                            
                            Text("Back")
                                .font(.montserrat(size: 16, weight: "Regular"))
                        }
                        .fontWeight(.bold)
                        .padding(8)
                        .padding(.horizontal, 4)
                        .background(
                            CustomBlur.Blur(style: .extraLight)
                        )
                        .cornerRadius(64)
                    }
                }
                .padding()
                
                Spacer()
                
                Text("Get Started Now!")
                    .foregroundColor(.white)
                    .font(.montserrat(size: 32, weight: "Bold"))
                    .padding()
                    .padding(.top, 64)
                
                Text("Create an account or login to your account")
                    .font(.montserrat(size: 16, weight: "Regular"))
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .padding(.bottom, 64)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 32)
                        .ignoresSafeArea()
                        .foregroundStyle(colorScheme == .dark ? Color(.systemGray6) : Color.white)
                        .frame(height: 400)
                    
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
                                    .font(.montserrat(size: 16, weight: "Medium"))
                            }
                            .sheet(isPresented: $isSignUp) {
                                SignUpView()
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
                                        .foregroundColor(.accentColor)
                                        .frame(width: 32)
                                    
                                    Text("Email")
                                        .foregroundColor(Color(.systemGray)
                                        .opacity(0.5))
                                        .font(.montserrat(size: 16, weight: "Regular"))
                                }
                                
                                HStack {
                                    Image(systemName: "lock.shield")
                                        .foregroundColor(.accentColor)
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
                                ZStack {
                                    RoundedRectangle(cornerRadius: 16)
                                        .frame(height: 48)
                                    
                                    Text("Log In")
                                        .font(.montserrat(size: 16, weight: "Regular"))
                                        .foregroundColor(.white)
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
            }
        }
    }
}

#Preview {
    LogInScreenView()
}

struct SignUpView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(spacing: 24) {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 48, height: 8)
                .foregroundColor(Color(.systemGray).opacity(0.5))
            
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
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .frame(height: 48)
                        
                        Text("Sign In")
                            .foregroundColor(.white)
                    }
                }
            }
            
            Spacer()
        }
        .padding()
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
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(height: 48)
                    
                    Text("Restore")
                        .foregroundColor(.white)
                }
            }
            
            Spacer()
        }
        .padding()
    }
}

//ZStack {
//    RoundedRectangle(cornerRadius: 24)
//        .foregroundColor(.black.opacity(0.9))
//        .frame(height: 96)
//        .shadow(color: .red, radius: 1)
//        .padding()
//    
//    VStack {
//        HStack {
//            Image(systemName: "exclamationmark.triangle")
//                .resizable()
//                .frame(width: 24, height: 24)
//            
//            Text("Error")
//                .fontWeight(.medium)
//        }
//        
//        Text("Your password is too weak")
//    }
//    .foregroundColor(.red.opacity(0.5))
//}
