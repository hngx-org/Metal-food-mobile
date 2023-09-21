//
//  SigninView.swift
//  Free Lunch
//
//  Created by Yusuf Akeem on 20/09/2023.
//
import SwiftUI
struct SigninView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isSignUpActive = false
    
    var body: some View {
        NavigationView {
            VStack {
                TopLabel()
                    .padding(.bottom, 20)
                CustomTextFieldView(username: $username, entryName: "Username:", placeHolder: "Tofunmi", textfieldImage: "icon-park-solid_edit-name", isSecure: false)
                    .padding(.bottom, 10)
                
                CustomTextFieldView(username: $password, entryName: "Password:", placeHolder: "********", textfieldImage: "eye crossed out", isSecure: true)
                    .padding(.bottom, 10)
                
                HStack {
                    Spacer()
                        .foregroundColor(.yellow)
                }
                
                CustomButton(title: "Sign In") {
                }
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                
                Spacer()
                
                HStack {
                    Text("Don't have an account?")
                    Button(action: {
                        print("Create account tapped!")
                        self.isSignUpActive = true
                    }) {
                        Text("Create one now")
                            .foregroundColor(Color("Primary"))
                            .fontWeight(.bold)
                    }
                }
                Spacer()
            }
            .padding()
            .navigationBarHidden(true)
            .fullScreenCover(isPresented: $isSignUpActive) {
                SignupView()
            }
        }
        .modifier(HideKeyboardOnTap())
    }
}

struct SigninView_Previews: PreviewProvider {
    static var previews: some View {
        SigninView()
    }
}

struct TopLabel: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Hi there,")
                .font(.system(size: 16))
                .fontWeight(.bold)
            
            Text("Welcome back!")
                .font(.system(size: 28))
                .fontWeight(.medium)
                .foregroundColor(Color("Primary"))
            
            Text("Please input your log-in details to get into the app")
                .font(.title2)
                .fontWeight(.light)
                .font(.system(size: 19))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
