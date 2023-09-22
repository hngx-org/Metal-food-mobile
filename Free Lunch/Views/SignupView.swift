//
//  SignupView.swift
//  Free Lunch
//
//  Created by Yusuf Akeem on 20/09/2023.
//

import SwiftUI
struct SignupView: View {
    @State private var fullname: String = ""
    @State private var lastname: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var verification: String = ""
    @State private var rememberMe = false
    @State private var isSigninActive = false
    @State private var isFirst = false
    
    var body: some View {
            NavigationView {
                ScrollView {
                    VStack(spacing: 22) {
                        TitleAndDescriptionLabel()
                        HStack(spacing: 0){
                            Text("ORGANIZATION")
                                .font(.title3.bold())
                                .foregroundColor(isFirst ?.white:.black)
                                .padding(.horizontal,10)
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                                .background(Color(isFirst ? "Primary": "white"))
                                .cornerRadius(10)
                                .onTapGesture {
                                    isFirst = true
                                }
                            Text("STAFF")
                                .font(.title3.bold())
                                .foregroundColor(!isFirst ?.white:.black)
                                .padding(.horizontal,21)
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                                .background(Color(!isFirst ? "Primary": "white"))
                                .cornerRadius(10)
                                .onTapGesture {
                                    isFirst = false
                                }
                        }
                        .frame(maxWidth: .infinity)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                             .stroke(Color("Primary"), lineWidth: 1)
             )
                        if !isFirst {
                            HStack {
                                CustomTextFieldView(username: $fullname, entryName: "First name:", placeHolder: "enter first name", textfieldImage: "person", isSecure: false)
                                
                                CustomTextFieldView(username: $lastname, entryName: "Last name:", placeHolder: "enter first name", textfieldImage: "person", isSecure: false)
                            }
                        } else {
                            CustomTextFieldView(username: $fullname, entryName: "Organization’s Name:", placeHolder: "Enter your organization’s name", textfieldImage: "person", isSecure: false)
                        }
                        
                        if !isFirst {
                            CustomTextFieldView(username: $email, entryName: "Work Email Address:", placeHolder: "xyz@gmail.com", textfieldImage: "mail", isSecure: false)
                        } else {
                            CustomTextFieldView(username: $email, entryName: "Email Adress:", placeHolder: "xyz@gmail.com", textfieldImage: "mail", isSecure: false)
                        }
                        
                        VStack {
                            CustomTextFieldView(username: $confirmPassword, entryName: "Confirm Password:", placeHolder: "********", textfieldImage: "padlock", isSecure: true)
                            
                            CustomTextFieldView(username: $password, entryName: "Password:", placeHolder: "********", textfieldImage: "padlock", isSecure: true)
                        }
                        
                        if !isFirst {
                            CustomTextFieldView(username: $verification, entryName: "Verification Code:", placeHolder: "Enter verification code", textfieldImage: "", isSecure: false)
                        } else {
                            /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
                        }
                        Toggle("Remember me", isOn: $rememberMe)
                        
                        Spacer()
                        PrimaryButton(text: "Create Account")
                        
                        HStack {
                            Text("Already have an account?")
                            Button(action: {
                                print("Sign in tapped!")
                                self.isSigninActive = true
                            }) {
                                Text("Sign in")
                                    .foregroundColor(Color("Primary"))
                                    .fontWeight(.bold)
                            }
                        }
                    }
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                    .fullScreenCover(isPresented: $isSigninActive) {
                        SigninView()
                }
                }
            }
            .modifier(HideKeyboardOnTap())
        }
    }

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}

struct TitleAndDescriptionLabel: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Create an Account")
                .foregroundColor(Color("Primary"))
                .font(.system(size: 28, weight: .bold))
                .multilineTextAlignment(.center)
                .padding(.top, 20)
            
            Text("Create a new account to get started or sign in if you have an account already")
                .font(.headline)
                .fontWeight(.light)
                .multilineTextAlignment(.leading)
        }
    }
}

struct HideKeyboardOnTap: ViewModifier {
    func body(content: Content) -> some View {
        content
            .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
    }
}

extension View {
    func hideKeyboardOnTap() -> some View {
        self.modifier(HideKeyboardOnTap())
    }
}

