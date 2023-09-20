//
//  ProgressTab.swift
//  Free Lunch
//
//  Created by David OH on 20/09/2023.
//

import SwiftUI

struct ProgressTabs: View {
    var position: Int = 0
    var body: some View {
        ZStack(alignment: .leading){
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 4)
                           .foregroundColor(Color(.gray).opacity(0.15))
                           .cornerRadius(10)
                       
            HStack(){
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 4)
                       .cornerRadius(10)
                       .foregroundColor(position == 0 ? Color("Primary"): Color(.gray).opacity(0.15))
                        
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 4)
                       .cornerRadius(10)
                    .foregroundColor(position == 1 ? Color("Primary"): Color(.gray).opacity(0.15))
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 4)
                       .cornerRadius(10)
                    .foregroundColor(position == 2 ? Color("Primary"): Color(.gray).opacity(0.15))
            }
        }
    }
}

struct ProgressTabs_Previews: PreviewProvider {
    static var previews: some View {
        ProgressTabs(position: 1)
    }
}
