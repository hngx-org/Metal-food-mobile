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
    @State private var rememberMe = false
    @State private var isSigninActive = false
    
    var body: some View {
            NavigationView {
                VStack(spacing: 20) {
                    TitleAndDescriptionLabel()
                    HStack {
                        CustomTextFieldView(username: $fullname, entryName: "First name:", placeHolder: "Tofunmi", textfieldImage: "icon-park-solid_edit-name", isSecure: false)
                        
                        CustomTextFieldView(username: $lastname, entryName: "Last name:", placeHolder: "Tofunmi", textfieldImage: "icon-park-solid_edit-name", isSecure: false)
                    }
                    
                    CustomTextFieldView(username: $email, entryName: "Email:", placeHolder: "xyz@gmail.com", textfieldImage: "iconamoon_email-fill", isSecure: false)
                    
                    CustomTextFieldView(username: $password, entryName: "Password:", placeHolder: "********", textfieldImage: "solar_lock-password-bold", isSecure: true)
                    
                    Toggle("Remember me", isOn: $rememberMe)
                    
                    Spacer()
                    CustomButton(title: "Create Account") {
                    }
                    
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
                .navigationBarHidden(true)
                .fullScreenCover(isPresented: $isSigninActive) {
                    SigninView()
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

