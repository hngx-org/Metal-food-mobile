//
//  RewardSuccessOnlyView.swift
//  Free Lunch
//
//  Created by Tes on 20/09/2023.
//

import SwiftUI

struct RedeemLunchSuccessfulView: View {
    var body: some View {
        ZStack {
            Image("confetti")
            VStack(spacing: 30) {
                Spacer()
                    .frame(maxHeight: 18)
                Image("okAvatar")
                    .resizable().scaledToFit()
                    .frame(width: 300, height: 300)
                Spacer()
                    .frame(maxHeight: 8)
                Text("Free lunch redeemed successfully!")
                        .font(.title.bold())
                        .multilineTextAlignment(.center)
                Spacer()
                    .frame(maxHeight: 58)
                Button {
                    print("pressed")
                } label: {
                    Text("Back to home")
                        .frame(maxWidth: .infinity)
                }
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .background(Color(hex: "#390D7C"))
                .cornerRadius(8)
                Spacer()
                    .frame(maxHeight: 18)
            }
            .padding(30)
        }
    }
}

struct RedeemLunchSuccessfulView_Previews: PreviewProvider {
    static var previews: some View {
        RedeemLunchSuccessfulView()
    }
}
