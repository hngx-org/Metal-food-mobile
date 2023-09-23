//
//  LeaderBoardList.swift
//  Free Lunch
//
//  Created by David OH on 20/09/2023.
//

import SwiftUI

struct LeaderBoardList: View {
    
    var img: String = "test1"
    var name: String = "Uduak Edem"
    var department: String = "Finance"
    var score: String = "30"
    var body: some View {
        VStack {
            HStack(spacing: 15) {
                Image(img)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .cornerRadius(50)
                VStack(alignment: .leading,spacing: 5) {
                    Text(name)
                        .font(.body)
                        .fontWeight(.bold)
                    Text(department)
                        .font(.body)
                        .fontWeight(.regular)
                }
                Spacer()
                VStack(alignment: .trailing,spacing: 5) {
                Text(score)
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(.red)
                   Image("arrow")
                        .resizable()
                        .frame(width: 12,height: 12)
                        .padding(.trailing,5)
                }
            }
            Divider()
        }
    }
}

struct LeaderBoardList_Previews: PreviewProvider {
    static var previews: some View {
        LeaderBoardList()
    }
}

