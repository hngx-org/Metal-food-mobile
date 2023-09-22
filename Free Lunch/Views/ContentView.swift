//
//  ContentView.swift
//  Free Lunch
//
//  Created by David OH on 19/09/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var isSignedIn = false
    var body: some View {
        if isSignedIn {
            TabBar()
        } else {
            SigninView(isSignedIn: $isSignedIn)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
