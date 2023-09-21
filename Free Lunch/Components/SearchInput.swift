//
//  SearchInput.swift
//  Free Lunch
//
//  Created by David OH on 19/09/2023.
//

import SwiftUI

struct SearchInput: View {
    @Binding var text: String
    var hint: String = "Search"
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.secondary)
            
            TextField(hint, text: $text)
        }
        .padding(10)
        .cornerRadius(10)
        .overlay(RoundedRectangle(cornerRadius: 10)
            .stroke(.black,lineWidth: 0.3))
    }
}
struct SearchInput_Previews: PreviewProvider {
    static var previews: some View {
        SearchInput(text: .constant("true"))
    }
}

