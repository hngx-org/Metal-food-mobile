//
//  DashBoardHeader.swift
//  Free Lunch
//
//  Created by David OH on 19/09/2023.
//

import SwiftUI

struct DashBoardHeader: View {
    var image: String = "test1"
    var name: String = "David OH"
    var body: some View {
        HStack {
                Image(image)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .cornerRadius(50)
                
                VStack (alignment: .leading){
                    Text("\(name),")
                        .font(.body)
                    Text("How are you doing today?")
                        .font(.body)
                    .fontWeight(.bold)
                }
            }
        .padding(.vertical, 10)
    .padding(.horizontal, 8)
    }
}

struct DashBoardHeader_Previews: PreviewProvider {
    static var previews: some View {
        DashBoardHeader()
    }
}
