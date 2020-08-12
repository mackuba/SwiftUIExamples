//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Kuba Suder on 28.07.2020.
//  Copyright © 2020 Kuba Suder. All rights reserved.
//

import SwiftUI

extension View {
    func setNavigationBarTitle(_ text: String) -> some View {
        #if os(watchOS)
        return self.navigationBarTitle(Text(text))
        #else
        return self.navigationBarTitle(Text(text), displayMode: .inline)
        #endif
    }
}

struct LandmarkList<DetailView: View>: View {
    @EnvironmentObject var userData: UserData

    let detailViewProducer: (Landmark) -> DetailView

    var body: some View {
        List {
            Toggle(isOn: $userData.showFavoritesOnly) {
                Text("Favorites Only")
            }
            ForEach(userData.landmarks) { landmark in
                if landmark.isFavorite || !self.userData.showFavoritesOnly {
                    NavigationLink(destination: self.detailViewProducer(landmark)) {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
        }
        .setNavigationBarTitle("Landmarks")
    }
}

struct LandmarkList_Previews: PreviewProvider {
    #if os(iOS)
    static var previews: some View {
        Group {
            ForEach(["iPhone SE (1st generation)", "iPhone 11 Pro Max"], id: \.self) { deviceName in
                NavigationView {
                    LandmarkList() { LandmarkDetail(landmark: $0) }
                }
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
            }

            NavigationView {
                LandmarkList() { LandmarkDetail(landmark: $0) }
            }
            .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
            .previewDisplayName("iPhone 8 dark mode")
            .environment(\.colorScheme, .dark)
        }
        .environmentObject(UserData())
    }
    #else
    static var previews: some View {
        LandmarkList() { WatchLandmarkDetail(landmark: $0) }
            .environmentObject(UserData())
    }
    #endif
}
