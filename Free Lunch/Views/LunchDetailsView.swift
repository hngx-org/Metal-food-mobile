//
//  LunchDetailsView.swift
//  Free Lunch
//
//  Created by Tes on 19/09/2023.
//

import SwiftUI

struct LunchDetailsView: View {
    @Environment(\.dismiss) var dismiss
    var sampleModel = InstructionDetailsModel(message: "Kudos to you! Your hard work and dedication have truly paid off to the department and the company at large. Keep up the fantastic work!", nameAndPosition: "Tofunmi, HR", image: Image("avatar"))
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    Spacer()
                        .frame(maxHeight: 8)
                    Image("cup")
                        .frame(width: 120, height: 120)
                    Spacer()
                        .frame(minHeight: 30 ,maxHeight: 48)
                    Text(LunchDetailsViewString.congrats)
                        .padding(15)
                        .lineLimit(2)
                        .multilineTextAlignment(.center)
                        .font(.title2)
                        .foregroundColor(Color("Primary"))
                    Spacer()
                        .frame(height: 48)
                    LunchDetailsInstructionView(model: sampleModel)
                        .frame(height: 200)
                        .cornerRadius(20)
                    Spacer()
                        .frame(minHeight: 60 ,maxHeight: 120)
                   NavigationLink(){
                        RedeemLunchSuccessfulView()
                    }
                label: {
                        PrimaryButton(text: "Lunch Details")
                        
                    }
                    .navigationBarBackButtonHidden(true)
                }
                .padding()
            }
        }
    }
}

struct LunchDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        LunchDetailsView()
    }
}

struct LunchDetailsViewString {
    static var congrats = "Congratulations on getting a free lunch. Keep up the good work!!!"
}
