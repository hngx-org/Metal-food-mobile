//
//  DashBoardMainCard.swift
//  Free Lunch
//
//  Created by David OH on 20/09/2023.
//

import SwiftUI

struct DashBoardMainCard: View {
    var body: some View {
        NavigationStack {
            HStack(alignment: .top){
                VStack(alignment: .leading) {
                    Text("You have been rewarded!!!")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.top,20)
                    Text("You have 2 pending lunches to redeem")
                        .font(.title2)
                    .padding(.top,10)
                    NavigationLink {
                        History()
                    } label: {
                        PrimaryButton(text: "Redeem")
                            .padding(.top,30)
                    }

                   
                }
                Image("dashboardtrophy")
                    .resizable()
                    .aspectRatio( contentMode: .fill)
                    .frame(maxWidth: 110,maxHeight: 280)
               
            }.frame(maxWidth:.infinity)
                .padding(.horizontal)
                .background(.yellow)
            .cornerRadius(20)
        }
    }
}

struct DashBoardMainCard_Previews: PreviewProvider {
    static var previews: some View {
        DashBoardMainCard()
    }
}
