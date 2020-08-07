//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Kuba Suder on 28.07.2020.
//  Copyright © 2020 Kuba Suder. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var userData: UserData

    var body: some View {
        List {
            Toggle(isOn: $userData.showFavoritesOnly) {
                Text("Favorites Only")
            }
            ForEach(userData.landmarks) { landmark in
                if landmark.isFavorite || !self.userData.showFavoritesOnly {
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
        }
        .navigationBarTitle(Text("Landmarks"), displayMode: .inline)
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(["iPhone SE (1st generation)", "iPhone 11 Pro Max"], id: \.self) { deviceName in
                NavigationView {
                    LandmarkList()
                }
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
            }

            NavigationView {
                LandmarkList()
            }
            .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
            .previewDisplayName("iPhone 8 dark mode")
            .environment(\.colorScheme, .dark)
        }
        .environmentObject(UserData())
    }
}
