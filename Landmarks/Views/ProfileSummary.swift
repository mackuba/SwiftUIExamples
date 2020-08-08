//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by Kuba Suder on 08.08.2020.
//  Copyright © 2020 Kuba Suder. All rights reserved.
//

import SwiftUI

struct ProfileSummary: View {
    var profile: Profile

    static let goalFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none

        return formatter
    }()

    var body: some View {
        List {
            Text(profile.username)
                .bold()
                .font(.title)

            Text("Notifications: \(self.profile.prefersNotifications ? "On": "Off" )")

            Text("Seasonal Photos: \(self.profile.seasonalPhoto.rawValue)")

            Text("Goal Date: \(self.profile.goalDate, formatter: Self.goalFormat)")
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
    }
}
