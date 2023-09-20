//
//  LunchDetailsInstructionView.swift
//  Free Lunch
//
//  Created by Tes on 20/09/2023.
//

import SwiftUI

struct LunchDetailsInstructionView: View {
    var model: InstructionDetailsModel
    var body: some View {
        ZStack {
            Color(hex: "#F5F5F5")
            VStack() {
                Text("\"\(model.message)\"")
                    .foregroundColor(Color(hex: "#3C3C3C"))
                    .font(.callout)
                    .multilineTextAlignment(.center)
                    .accessibilityAddTraits(.isHeader)
                HStack{
                    model.image
                        .frame(width: 50, height: 50)
                        .cornerRadius(25)
                    Text(model.nameAndPosition)
                        .font(.title3.bold())
                }
                .font(.caption)
            }
            .padding(10)
        }
    }
}

struct LunchDetailsInstructionView_Previews: PreviewProvider {
    static var emptyModel = InstructionDetailsModel(message: "Kudos to you! Your hard work and dedication have truly paid off to the department and the company at large. Keep up the fantastic work!", nameAndPosition: "Tofunmi, HR", image: Image("avatar"))
    static var previews: some View {
        LunchDetailsInstructionView(model: emptyModel)
    }
}

struct InstructionDetailsModel {
    var message: String
    var nameAndPosition: String
    var image: Image
}
