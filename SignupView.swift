//
//  SignupView.swift
//  Free Lunch
//
//  Created by Yusuf Akeem on 20/09/2023.
//

import SwiftUI

struct SignupView: View {
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var rememberMe = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleAndDescriptionLabel()
            
            CustomTextFieldView(username: $username, entryName: "Username:", placeHolder: "Tofunmi", textfieldImage: "icon-park-solid_edit-name")
            
            CustomTextFieldView(username: $email, entryName: "Email:", placeHolder: "xyz@gmail.com", textfieldImage: "iconamoon_email-fill")
            
            CustomTextFieldView(username: $password, entryName: "Password:", placeHolder: "********", textfieldImage: "solar_lock-password-bold")
            
            Toggle("Remember me", isOn: $rememberMe)
            
            Spacer()
            CustomButton(title: "Sign up")
            Spacer().frame(maxHeight: 18)
        }
        .padding(20)
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


