//
//  Stage.swift
//  Free Lunch
//
//  Created by David OH on 20/09/2023.
//

import SwiftUI

struct Stage: View {
    var posImg: String = "1st"
    var img: String = "test1"
    var text1: String = "Uduak Edem"
    var text2: String = "30"
    var text3: String = "Finance"
    var width: CGFloat = 80
    var body: some View {
        
        VStack(spacing:10){
            VStack {
                Image(posImg)
                    .resizable()
                    .aspectRatio( contentMode: .fit)
                    .frame(width: 30, height: 30)
                Image(img)
                    .resizable()
                    .frame(width: width, height: width)
                    .cornerRadius(50)
            }
            Text(text1)
                .font(.body)
                .fontWeight(.bold)
            Text(text2)
                .font(.body)
                .fontWeight(.bold)
                .foregroundColor(posImg == "3rd" ?.yellow: Color("Primary"))
            Text(text3)
                .font(.body)
                .fontWeight(.bold)
        }
    }
}

struct Stage_Previews: PreviewProvider {
    static var previews: some View {
        Stage()
    }
}
