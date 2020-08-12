//
//  WatchLandmarkDetail.swift
//  WatchLandmarks Extension
//
//  Created by Kuba Suder on 11.08.2020.
//  Copyright © 2020 Kuba Suder. All rights reserved.
//

import SwiftUI

struct WatchLandmarkDetail: View {
    @EnvironmentObject var userData: UserData

    var landmark: Landmark

    var landmarkIndex: Int {
        userData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }

    var body: some View {
        ScrollView {
            VStack {
                CircleImage(image: landmark.image.resizable())
                    .scaledToFit()
                    .padding([.horizontal, .top], 16)

                Text(landmark.name)
                    .font(.headline)
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)

                Toggle(isOn: $userData.landmarks[self.landmarkIndex].isFavorite) {
                    Text("Favorite")
                }

                Divider()

                Text(landmark.park.replacingOccurrences(of: "National Park", with: "NP"))
                    .font(.caption)
                    .bold()
                    .lineLimit(1)
                    .minimumScaleFactor(0.9)

                Text(landmark.state)
                    .font(.caption)

                Divider()

                WatchMapView(landmark: landmark)
                .scaledToFit()
                .padding()
            }
        }
        .navigationBarTitle("Landmarks")
    }
}

struct WatchLandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()

        return Group {
            WatchLandmarkDetail(landmark: userData.landmarks[0])
                .previewLayout(.fixed(width: 162, height: 440))

            WatchLandmarkDetail(landmark: userData.landmarks[0])
                .previewDevice("Apple Watch Series 3 - 42mm")

            WatchLandmarkDetail(landmark: userData.landmarks[1])
                .previewDevice("Apple Watch Series 3 - 38mm")

            WatchLandmarkDetail(landmark: userData.landmarks[2])
                .previewDevice("Apple Watch Series 5 - 44mm")
        }
        .environmentObject(userData)
    }
}
