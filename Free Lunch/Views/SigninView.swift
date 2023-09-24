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
    @State private var hasSignedIn = false
    @Binding var isSignedIn: Bool
    @StateObject private var lvm = LoginVM()
    
    var body: some View {
        LoadingOverlay(isLoading: lvm.state == .submitting){
            VStack {
                TopLabel()
                    .padding(.bottom, 20)
                CustomTextFieldView(username: $lvm.person.email, entryName: "Username:", placeHolder: "Tofunmi", textfieldImage: "person", isSecure: false)
                    .padding(.bottom, 10)
                
                CustomTextFieldView(username:  $lvm.person.password, entryName: "Password:", placeHolder: "********", textfieldImage: "eye", isSecure: true)
                    .padding(.bottom, 40)
                Button {
                    Task {
                        await lvm.loginUser()
                        /// checking if login is successful with status code then login and move to dashboard
                        let code = lvm.loginStatusCode
                        if code == 200 {
                            print("see code is 200")
                            self.hasSignedIn = true
                        } else {
                            /// for debugging purpose
                            print("code not 200, but \(code ?? 0)")
                        }
                    }
                } label: {
                    PrimaryButton(text:  "Sign In")
                }
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
            .fullScreenCover(isPresented: $isSignUpActive) {
                SignupView()
            }
            .fullScreenCover(isPresented: $hasSignedIn) {
                TabBar()
            }
            .modifier(HideKeyboardOnTap())
        }
        .alert(isPresented: $lvm.hasError, error: lvm.error) {
            
        }
    }
}

struct SigninView_Previews: PreviewProvider {
    static var previews: some View {
        SigninView(isSignedIn: .constant(true))
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




