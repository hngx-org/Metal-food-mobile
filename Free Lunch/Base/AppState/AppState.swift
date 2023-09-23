//
//  AppState.swift
//  Free Lunch
//
//  Created by David OH on 23/09/2023.
//

import SwiftUI


class DashboardEnvironment: ObservableObject {
    @Published var path: [DashboardPath] = []
}

enum DashboardPath: Hashable, Equatable {
    case freelunch
    case history
    case freelunchsuccess
    case lunchdetails
    case redeem
    
    
}

extension DashboardPath: View {
    var body: some View {
        switch self {
        case .freelunch:
            FreeLunch()
        case .history:
            History()
        case .freelunchsuccess:
            SendLunchSuccessfulView()
        case .lunchdetails:
           LunchDetailsView()
        case .redeem:
            RedeemLunchSuccessfulView()
        }
    }
}
