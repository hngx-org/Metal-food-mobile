//
//  TabView.swift
//  Free Lunch
//
//  Created by David OH on 19/09/2023.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        VStack(spacing: 0.0) {
            TabView {
                DashBoard()
                    .tabItem {
                        Image("home")
                    }
                FreeLunch()
                    .tabItem {
                        Image("trophy")
                    }

                Profile()
                    .tabItem {
                        Image(systemName: "gearshape")
                    }
            }
        }
    }
}
