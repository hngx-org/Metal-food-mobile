//
//  DashBoard.swift
//  Free Lunch
//
//  Created by David OH on 19/09/2023.
//

import SwiftUI


struct DashBoard: View {
    @Binding var selectedTab: Int
    var image: String = "test1"
    var name: String = "David OH"
    @StateObject var env = DashboardEnvironment()
    var body: some View {
        NavigationStack(path: $env.path)  {
            VStack(alignment: .leading,spacing: 30) {
                DashBoardHeader()
                DashBoardMainCard()
                HStack {
                    NavigationLink(value: DashboardPath.freelunch) {
                    GreyCard()
                } .buttonStyle(PlainButtonStyle())
                    Button{
                       selectedTab = 1
                    }
                label:{
                    GreyCard(image: "leaderboard", name: "Leader Board")
                }.buttonStyle(PlainButtonStyle())
                }
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top)
            .padding()
            .navigationDestination(for: DashboardPath.self) { path in
                path
                    .environmentObject(env)
            }
            
        }
    }
}

struct DashBoard_Previews: PreviewProvider {
    static var previews: some View {
        DashBoard(selectedTab: .constant(0))
    }
}
