//
//  SigninView.swift
//  Free Lunch
//
//  Created by Yusuf Akeem on 20/09/2023.
//

import SwiftUI

struct SigninView: View {
    @State var username: String = ""
    var body: some View {
        
        VStack {
            TopLabel()
                .padding(.bottom, 20)
            CustomTextFieldView(username: $username, entryName: "Username:", placeHolder: "Tofunmi", textfieldImage: "icon-park-solid_edit-name")
            CustomTextFieldView(username: $username, entryName: "Password:", placeHolder: "********", textfieldImage: "eye crossed out")
            HStack {
                Spacer()
                Text("Forgot Password?")
            }.padding(.top, 0)

            VStack {
                CustomButton(title: "Sign in")
            }
            Spacer()
            HStack {
                Text("Don't have an account?")
                Button(action: {
                    print("Button tapped!")
                }) {
                    Text("Create one now")
                        .foregroundColor(Color("Primary"))
                }
            }
            Spacer().frame()
        }
        .padding(10)
    }
}

struct SigninView_Previews: PreviewProvider {
    static var previews: some View {
        SigninView()
    }
}

struct TopLabel: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Hi there")
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
            
            Text("Welcome back!")
                .font(.system(size: 28))
                .fontWeight(.medium)
                .foregroundColor(Color("Primary"))
                .multilineTextAlignment(.leading)
            
            
            Text("Please input your log-in details to get into the app")
                .font(.title2)
                .fontWeight(.light)
                .font(.system(size: 19))
                .multilineTextAlignment(.leading)
        }
        .frame(maxWidth: .infinity)
    }
}
