//
//  Profile.swift
//  Free Lunch
//
//  Created by David OH on 20/09/2023.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        
        ScrollView() {
            VStack(spacing: 15) {
                Text("Profile")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("Primary"))
                    .frame(maxWidth: .infinity,alignment: .leading)
                Image("okAvatar")
                    .resizable().scaledToFit()
                    .frame(width: 100, height: 100)
                Text("Tofunmi Awolowo")
                    .font(.title.bold())
                Text("tofunmi.awolowo@gmail.com")
                    .tint(.black)
                    .font(.body)
                HStack {
                    HStack{
                        Text("Lunches Redeemed")
                            .font(.title3.bold())
                        Spacer()
                        Text("21")
                            .font(.title3.bold())
                    }
                    .padding()
                    .frame(width: 180)
                        .foregroundColor(.white)
                        .background(Color("Primary"))
                        .cornerRadius(20)
                        .overlay(RoundedRectangle(cornerRadius: 20)
                        .stroke(.white, lineWidth: 1))
                    Spacer()
                    HStack{
                        Text("Lunches Rewarded")
                            .font(.title3.bold())
                        Spacer()
                        Text("21")
                            .font(.title3.bold())
                    }
                    .padding()
                    .frame(width: 180)
                        .foregroundColor(.black)
                        .background(Color("yellow"))
                        .cornerRadius(20)
                        .overlay(RoundedRectangle(cornerRadius: 20)
                            .stroke(.white, lineWidth: 1))
                   
                }
                Divider()
                VStack(spacing: 30) {
                   ProfileList(img: "pperson")
                    ProfileList(img: "ppadlock",text: "Change Password")
                    ProfileList(img: "pwallet",text: "Coverted Lunches")
                    ProfileList(img: "pmoon",text: "Dark Theme")
                    ProfileList(img: "pshield",text: "Privacy Policy")
                   LogoutList()
                    
                    
                }
                .padding(.vertical,30)
            }.padding()
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
