//
//  TabView.swift
//  Free Lunch
//
//  Created by David OH on 19/09/2023.
//

import SwiftUI

struct TabBar: View {
    @State private var selectedTab = 0
    var body: some View {
        VStack(spacing: 0.0) {
            TabView(selection: $selectedTab) {
                DashBoard(selectedTab: $selectedTab)
                    .tabItem {
                        Image("home")
                        Text("Home")
                    }.tag(0)
                LeaderBoard()
                    .tabItem {
                        Image("trophy")
                        Text("Rewards")
                    }.tag(1)

                Profile()
                    .tabItem {
                        Image(systemName: "gearshape")
                        Text("Settings")
                    }.tag(2)
            }
            .onAppear {
                selectedTab = 0
            }
        }
    }
}
