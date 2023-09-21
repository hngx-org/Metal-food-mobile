//
//  RewardSuccessAndSendAnotherView.swift
//  Free Lunch
//
//  Created by Tes on 20/09/2023.
//

import SwiftUI

struct SendLunchSuccessfulView: View {
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            ZStack {
                Image("confetti")
                VStack(spacing: 8) {
                    Spacer()
                        .frame(maxHeight: 18)
                    Image("okAvatar")
                        .resizable().scaledToFit()
                        .frame(width: 300, height: 300)
                    Spacer()
                        .frame(maxHeight: 8)
                    Text("Free lunch sent successfully!")
                            .font(.title.bold())
                            .multilineTextAlignment(.center)
                    Spacer()
                        .frame(maxHeight: 58)
                    Button {
                       dismiss()
                    } label: {
                        PrimaryButton(text: "Send another employee lunch")
                    }
                    Button {
                           dismiss()
                        dismiss()
                    } label: {
                        Text("Back to home")
                            .frame(maxWidth: .infinity)
                    }
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color("Primary"))
                    .clipped()
                    .overlay(RoundedRectangle(cornerRadius: 8)
                        .stroke(Color("Primary"), lineWidth: 1))
                    
                    .padding(.top,10)
                    Spacer()
                        .frame(maxHeight: 18)
                }
                .padding(30)
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct SendLunchSuccessfulView_Previews: PreviewProvider {
    static var previews: some View {
        SendLunchSuccessfulView()
    }
}
