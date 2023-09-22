//
//  CustomTextFieldView.swift
//  Free Lunch
//
//  Created by Yusuf Akeem on 20/09/2023.
//

import SwiftUI

struct CustomTextFieldView: View {
    @Binding var username: String
    var entryName: String
    var placeHolder: String
    var textfieldImage: String
    var isSecure: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(entryName)
            HStack {
                if isSecure {
                    SecureField(placeHolder, text: $username)
                } else {
                    TextField(placeHolder, text: $username)
                }
                Image(textfieldImage)
            }
            .frame(height: 50)
            .cornerRadius(25)
            .padding(.horizontal, 10)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.black, lineWidth: 0.3)
            )
        }
    }
}

struct CustomTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextFieldView(username: .constant(""), entryName: "Username", placeHolder: "Your username", textfieldImage: "padlock", isSecure: false)
    }
}

