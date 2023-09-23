//
//  RewardSuccessOnlyView.swift
//  Free Lunch
//
//  Created by Tes on 20/09/2023.
//

import SwiftUI

struct RedeemLunchSuccessfulView: View {
    @EnvironmentObject var env: DashboardEnvironment
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
                        env.path = []
                    } label: {
                        PrimaryButton(text: "Back to home")
                    }
                    Spacer()
                        .frame(maxHeight: 18)
                }
                .padding(30)
            }
            .navigationBarBackButtonHidden(true)
    }
}

struct RedeemLunchSuccessfulView_Previews: PreviewProvider {
    static var previews: some View {
        RedeemLunchSuccessfulView()
    }
}
