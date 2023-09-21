//
//  ProfileList.swift
//  Free Lunch
//
//  Created by David OH on 21/09/2023.
//

import SwiftUI

struct ProfileList: View {
    var img:String = "pperson"
    var text: String = "Edit Profile"
    var body: some View {
        HStack(spacing: 20){
            Image(img)
                .resizable()
                .frame(width: 30,height: 30)
            Text(text)
                .font(.title3)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(Color("Primary"))
            
        }
    }
}

struct LogoutList: View {
    var img:String = "plogout"
    var text: String = "Logout"
    var body: some View {
        HStack(spacing: 20){
            Image(img)
                .resizable()
                .frame(width: 30,height: 30)
            Text(text)
                .font(.title3)
            Spacer()
            
        }
    }
}
struct ProfileList_Previews: PreviewProvider {
    static var previews: some View {
        ProfileList()
    }
}
