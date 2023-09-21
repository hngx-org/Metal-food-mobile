//
//  PrimaryButtton.swift
//  Free Lunch
//
//  Created by David OH on 19/09/2023.
//

import SwiftUI

struct PrimaryButton: View {
    var text: String
    var background: Color = Color("Primary")
    var body: some View {
        Text(text)
            .foregroundColor(.white)
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .background(background)
            .cornerRadius(8)
            .shadow(radius: 10)
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(text:"Next")
    }
}

