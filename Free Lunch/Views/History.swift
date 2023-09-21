//
//  History.swift
//  Free Lunch
//
//  Created by David OH on 20/09/2023.
//

import SwiftUI

struct History: View {
    var date: String = "July 19 - August 15, 2023"
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
                VStack(alignment: .leading,spacing: 25) {
                    VStack{
                        HStack {
                            Button {
                                dismiss()
                            } label: {
                                    Image(systemName: "chevron.backward")
                                        .tint(.black)
                                
                            }
                            Text("Free Lunches")
                                .font(.title)
                                .fontWeight(.bold)
  .frame(maxWidth: .infinity,alignment: .center)
                        }
                        .padding(.top,60)
                        HStack {
                            Text("View your free lunch history so far")
                                .font(.title3)
                                .fontWeight(.semibold)
                            .padding(.top,20)
                            .padding(.bottom,30)
                        .frame(maxWidth: 240,alignment: .leading)
                            Spacer()
                        }
                    }
                        .frame(maxWidth: .infinity )
                        .foregroundColor(.white)
                        .padding(.horizontal,30)
                        .background(Color("Primary"))
                        .cornerRadius(20)
                    
                    VStack(spacing: 15) {
                        Rectangle()
                            .frame(width: 300, height: 40)
                                       .foregroundColor(Color(.gray).opacity(0.15))
                                       .cornerRadius(10)
                                       .overlay(
                                        HStack(){
                                           Image(systemName: "calendar")
                                               .resizable()
                                               .frame(width: 20,height: 20)
                                            Text(date)
                                                .font(.body)
                                                .fontWeight(.medium)
                                       })
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            Historylist()
                            Historylist(debit: true)
                            Historylist()
                            Historylist(debit: true)
                            Historylist()
                            Historylist(debit: true)
                            Historylist()
                            Historylist(debit: true)
                            Historylist()
                        }
                        .padding(.bottom,50)
                    }.padding(.horizontal,10)
                        .padding(.vertical,20)
            }.edgesIgnoringSafeArea(.all)
            //@Environment(\.dismiss) var dismiss
            .navigationBarBackButtonHidden(true)
//            .toolbar {
//                ToolbarItem(placement: .navigationBarLeading) {
//                    Button {
//                        dismiss()
//                    } label: {
//                        HStack {
//                            Image(systemName: "chevron.backward")
//                                .tint(.black)
//                        }
//                    }
//                }
//            }
        }
    }
}

struct History_Previews: PreviewProvider {
    static var previews: some View {
        History()
    }
}
