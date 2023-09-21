//
//  Historylist.swift
//  Free Lunch
//
//  Created by David OH on 20/09/2023.
//

import SwiftUI


struct Historylist: View {
    @Environment(\.dismiss) var dismiss
    @State private var shouldNavigate: Bool = false
    var img: String = "test1"
    var name: String = "You sent a free lunch to Bimpe in Recruitment department."
    var date: String = "August 2, 2023"
    var time: String = "11:30am"
    var debit: Bool = false
    var body: some View {
        NavigationStack {
           NavigationLink (
            destination:   LunchDetailsView(),isActive: $shouldNavigate,
             label: {
                HStack(alignment: .top, spacing: 15) {
                        Image(debit ? img:"succestrophy")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .cornerRadius(50)
                        VStack(alignment: .leading,spacing: 5) {
                            Text(name)
                                .font(.body)
                                .fontWeight(.semibold)
                                .frame(maxWidth: 280,alignment: .leading)
                            HStack {
                                Text(date)
                                    .font(.callout)
                                .fontWeight(.regular)
                                Spacer()
                                Text(time)
                                    .font(.callout)
                                .fontWeight(.regular)
                            }
                            
                            .frame(maxWidth: 280,alignment: .leading)
                        }
                        Spacer()
                    }.onTapGesture {
                        
                    }
                    
                    .padding()
                    .background(Color(debit ?"lightPink":"lightGreen"))
                    .cornerRadius(10)
                    .overlay(
                               RoundedRectangle(cornerRadius: 20)
                                .stroke(Color(debit ?"pink":"green"), lineWidth: 1)
                )
                
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            dismiss()
                        } label: {
                            HStack {
                                Image(systemName: "chevron.backward")
                                    .tint(.black)
                            }
                        }
                    }
            }
            })
           .onTapGesture(count: 1) {
//               if debit {
//                   // Code to execute if the condition is true
//               } else {
//                   self.shouldNavigate.toggle()
//               }
           }
        }
            
    }
}

struct Historylist_Previews: PreviewProvider {
    static var previews: some View {
        Historylist()
    }
}

