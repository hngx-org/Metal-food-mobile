//
//  Overlay.swift
//  Free Lunch
//
//  Created by David OH on 24/09/2023.
//

import SwiftUI

struct LoadingOverlay<Content>: View where Content: View {
    var isLoading: Bool
    var content: () -> Content

    var body: some View {
        ZStack {
            content()
                .disabled(isLoading)
                .blur(radius: isLoading ? 2 : 0) // Apply blur to the content when loading

            if isLoading {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture { /* Optionally, handle tap on the overlay */ }

                ProgressView() // You can replace this with your custom loading indicator
                    .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
                    .scaleEffect(3.0) // Adjust the size of the loading indicator
            }
        }
    }
}


struct OLoadingOverlay_Previews: PreviewProvider {
    static var previews: some View {
        LoadingOverlay(isLoading: true) {
            Text("")
        }
    }
}
