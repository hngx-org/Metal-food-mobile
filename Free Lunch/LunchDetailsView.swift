//
//  LunchDetailsView.swift
//  Free Lunch
//
//  Created by GIGL iOS on 19/09/2023.
//

import SwiftUI

struct LunchDetailsView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Text("Detail View")
            .navigationBarBackButtonHidden(true)
            .navigationTitle("Lunch Details")
            .navigationBarTitleDisplayMode(.inline)
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
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        HStack {
                            Image(systemName: "bell")
                                .tint(.black)
                        }
                    }
                }
            }
    }
}

struct LunchDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        LunchDetailsView()
    }
}
