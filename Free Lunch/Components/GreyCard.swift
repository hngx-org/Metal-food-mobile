//
//  GreyCard.swift
//  Free Lunch
//
//  Created by David OH on 19/09/2023.
//

import SwiftUI

struct GreyCard: View {
    
    var image: String = "reward"
    var name: String = "Give Free Lunch"
    var body: some View {
        VStack(spacing:15){
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100,height: 80)
            HStack(){
                Text(name)
                    .font(.body)
                .fontWeight(.bold)
                .frame(maxWidth: 100,alignment: .leading)
                Circle()
                    .strokeBorder(.black)
                    .frame(width: 40,height: 40)
                    .overlay( Image(systemName: "arrow.forward")
                        .frame(width: 40,height: 40))
               
                    
            }
            .padding(.leading)
        }.frame(maxWidth: .infinity,maxHeight: 200)
            .background(Color("CardColor"))
        .cornerRadius(15)
    }
}

struct GreyCard_Previews: PreviewProvider {
    static var previews: some View {
        GreyCard()
    }
}

