//
//  CustomButton.swift
//  Free Lunch
//
//  Created by Yusuf Akeem on 20/09/2023.
//
import SwiftUI

struct CustomButton: View {
    let title: String
    let action: () -> Void

    init(title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }

    var body: some View {
            Button(action: {
                print("Button tapped!")
            }) {
                Text(title)
                    .foregroundColor(.white)
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .background(Color("Primary"))
                    .cornerRadius(10)
            }
        }
    }

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(title: "Tap Me", action: {})
    }
}

