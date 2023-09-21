//
//  FreeLunch.swift
//  Free Lunch
//
//  Created by David OH on 19/09/2023.
//

import SwiftUI

struct FreeLunch: View {
    @Environment(\.dismiss) var dismiss
    @State var text: String = ""
    @State var note: String = ""
    var body: some View {
        NavigationStack {
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading,spacing: 25) {
                    HStack {
                        Button {
                            dismiss()
                        } label: {
                                Image(systemName: "chevron.backward")
                                    .tint(.black)
                            }
                    Text("Give Free Lunch")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color("Primary"))
                        .frame(maxWidth: .infinity,alignment: .center)
                }
                    Text("Select an employee you want to give free lunch for their exceptional effort.")
                        .fixedSize(horizontal: false, vertical: true)
                        .fontWeight(.semibold)
                        .font(.body)
                    
                    SearchInput(text: $text, hint: "Search for employee")
                    HStack{
                        Text("Who are you giving free lunch?")
                            .font(.callout)
                            .fontWeight(.bold)
                        Spacer()
                        Text("View all")
                            .foregroundColor(Color("Primary"))
                            .fontWeight(.semibold)
                    }
                    Stories()
                        .multilineTextAlignment(.leading)
                        .fontWeight(.semibold)
                        .font(.body)
                        .padding(.top,10)
                    VStack(alignment: .leading){
                        HStack {
                            Text("Personalized note")
                                .fontWeight(.semibold)
                            Text(" (optional):")
                        }
                        TextEditor(text: $note)
                            .scrollContentBackground(.hidden)
                            .frame(height:120)
                            .background(Color(.gray).opacity(0.15))
                            .cornerRadius(10)
                            .padding(.bottom,20)
                    }
                    NavigationLink {
                      SendLunchSuccessfulView()
                    } label: {
                        PrimaryButton(text: "Reward Employee")
                    }
                    
                }.frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top)
                    .padding(.horizontal)
                    .edgesIgnoringSafeArea(.all)
            }
            
            .navigationBarBackButtonHidden(true)
            
        }
    }
}

struct FreeLunch_Previews: PreviewProvider {
    static var previews: some View {
        FreeLunch()
    }
}

