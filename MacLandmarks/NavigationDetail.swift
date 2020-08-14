//
//  NavigationDetail.swift
//  MacLandmarks
//
//  Created by Kuba Suder on 13.08.2020.
//  Copyright © 2020 Kuba Suder. All rights reserved.
//

import MapKit
import SwiftUI

struct NavigationDetail: View {
    @EnvironmentObject var userData: UserData
    var landmark: Landmark

    var landmarkIndex: Int {
        userData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }

    var landmarkIsFavorite: Bool {
        return userData.landmarks[self.landmarkIndex].isFavorite
    }

    var openInMapsButton: some View {
        Button("Open in Maps") {
            let destination = MKMapItem(placemark: MKPlacemark(coordinate: self.landmark.locationCoordinate))
            destination.name = self.landmark.name
            destination.openInMaps()
        }
    }

    var favoriteButton: some View {
        Button(action: self.toggleFavoriteStatus) {
            if self.landmarkIsFavorite {
                Image("star-filled")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(.yellow)
                    .accessibility(label: Text("Remove from favorites"))
            } else {
                Image("star-empty")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(.gray)
                    .accessibility(label: Text("Add to favorites"))
            }
        }
        .frame(width: 20, height: 20)
        .buttonStyle(PlainButtonStyle())
    }

    func toggleFavoriteStatus() {
        userData.landmarks[self.landmarkIndex].isFavorite.toggle()
    }

    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 250)
                .overlay(
                    GeometryReader { geometry in
                        self.openInMapsButton
                            .frame(
                                width: geometry.size.width,
                                height: geometry.size.height,
                                alignment: .bottomTrailing
                            )
                            .offset(x: -10, y: -10)
                    }
                )

            VStack(alignment: .leading, spacing: 12) {
                HStack(spacing: 24) {
                    CircleImage(image: landmark.image.resizable(), shadowRadius: 4)
                        .frame(width: 160, height: 160)

                    VStack(alignment: .leading, spacing: 2) {
                        HStack {
                            Text(landmark.name).font(.title)

                            self.favoriteButton
                        }
                        Text(landmark.park)
                        Text(landmark.state).font(.caption)
                    }

                }

                Divider()

                Text("About \(landmark.name)")
                    .font(.headline)

                Text(landmark.description)
            }
            .padding()
            .frame(maxWidth: 700)
            .offset(x: 0, y: -50)
        }
    }
}

struct NavigationDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationDetail(landmark: landmarkData[0])
            .environmentObject(UserData())
            .previewLayout(.fixed(width: 600, height: 500))
    }
}
