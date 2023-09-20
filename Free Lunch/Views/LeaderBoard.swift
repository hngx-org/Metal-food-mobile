//
//  LeaderBoard.swift
//  Free Lunch
//
//  Created by David OH on 20/09/2023.
//

import SwiftUI

struct LeaderBoard: View {
    @State var tab: Int = 0
    var body: some View {
        NavigationStack {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading,spacing: 25) {
                Text("Leader Board")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("Primary"))
                    .frame(maxWidth: .infinity,alignment: .center)
                Text("This is a list that shows the ranking of most rewarded employees")
                    .fixedSize(horizontal: false, vertical: true)
                    .fontWeight(.semibold)
                    .font(.body)
                HStack{
                    TabText(isOn:tab==0 )
                        .onTapGesture {
                            tab = 0
                        }
                    Spacer()
                    TabText(text: "Week",isOn:tab==1 )
                        .onTapGesture {
                            tab = 1
                        }
                    Spacer()
                    TabText(text: "All Time",isOn:tab==2)
                        .onTapGesture {
                            tab = 2
                        }
                }
                ProgressTabs(position: tab)
                HStack(alignment: .bottom){
                    Stage(posImg: "2nd")
                    Spacer()
                    Stage(width: 100)
                    Spacer()
                    Stage(posImg: "3rd")
                    
                }
                .padding(.bottom,20)
                LeaderBoardList()
                LeaderBoardList()
                LeaderBoardList()
                LeaderBoardList()
                LeaderBoardList()
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top).padding(.horizontal)
        }
        }
    }
}

struct LeaderBoard_Previews: PreviewProvider {
    static var previews: some View {
        LeaderBoard()
    }
}


struct TabText: View {
    var text: String = "Today"
    var isOn: Bool = false
    var body: some View {
        Text(text)
            .font(.body)
            .fontWeight(isOn ?.bold: .regular)
    }
}

