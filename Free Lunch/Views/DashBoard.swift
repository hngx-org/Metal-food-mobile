//
//  DashBoard.swift
//  Free Lunch
//
//  Created by David OH on 19/09/2023.
//

import SwiftUI

struct DashBoard: View {
    var image: String = "test1"
    var name: String = "David OH"
    var body: some View {
        NavigationStack  {
            VStack(alignment: .leading,spacing: 30) {
                DashBoardHeader()
                DashBoardMainCard()
                HStack {
                    NavigationLink{
                        FreeLunch()
                    }
                label:{
                    GreyCard()
                }.buttonStyle(PlainButtonStyle())
                    NavigationLink{
                        LeaderBoard()
                    }
                label:{
                    GreyCard(image: "leaderboard", name: "Leader Board")
                }.buttonStyle(PlainButtonStyle())
                }
            }.frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top)
                .padding()
        }
    }
}

struct DashBoard_Previews: PreviewProvider {
    static var previews: some View {
        DashBoard()
    }
}
