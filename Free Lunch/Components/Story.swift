//
//  Story.swift
//  Free Lunch
//
//  Created by David OH on 19/09/2023.
//

import SwiftUI

struct Story: View {
    var image: String = "test1"
       var name: String = "David OH"
       
       var body: some View {
           VStack {
                   Image(image)
                       .resizable()
                       .frame(width: 65, height: 65)
                       .cornerRadius(50)
               
               .overlay(
                   Circle()
                       .stroke(LinearGradient(colors: [.red, .purple, .red, .orange, .yellow, .orange], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2.3)
                       .frame(width: 65, height: 61)
               )
               .frame(width: 70, height: 70)
               
               Text(name)
                   .font(.caption)
           }
       }
   }

   struct Story_Previews: PreviewProvider {
       static var previews: some View {
           Story()
       }
}

