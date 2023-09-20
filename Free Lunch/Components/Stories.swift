//
//  Stories.swift
//  Free Lunch
//
//  Created by David OH on 19/09/2023.
//

import SwiftUI

struct Stories: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
                   HStack(spacing: 15.0) {
                       Story()
                       Story(image: "test1", name: "Willie Yam")
                       Story(image: "test2", name: "Meng To")
                       Story(image: "test3", name: "Akson")
                       Story(image: "test4", name: "Steph")
                       Story(image: "test1", name: "Sam")
                       Story(image: "test2", name: "Dara")
                       Story(image: "test3", name: "Sourany")
                       Story(image: "test4", name: "Pom")
                   }
                   .padding(.horizontal, 8)
               }
               .padding(.vertical, 10)
           }
       }

struct Stories_Previews: PreviewProvider {
    static var previews: some View {
        Stories()
    }
}
