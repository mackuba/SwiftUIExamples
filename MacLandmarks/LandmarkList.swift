//
//  LandmarkList.swift
//  MacLandmarks
//
//  Created by Kuba Suder on 12.08.2020.
//  Copyright © 2020 Kuba Suder. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject private var userData: UserData
    @Binding var selectedLandmark: Landmark?
    @Binding var filter: FilterType

    func matchesFavoriteFilter(_ landmark: Landmark) -> Bool {
        return landmark.isFavorite || !self.userData.showFavoritesOnly
    }

    func matchesCategoryFilter(_ landmark: Landmark) -> Bool {
        return self.filter == .all
            || self.filter.category == landmark.category
            || (self.filter.category == .featured && landmark.isFeatured)
    }

    var body: some View {
        List(selection: $selectedLandmark) {
            ForEach(userData.landmarks) { landmark in
                if self.matchesFavoriteFilter(landmark) && self.matchesCategoryFilter(landmark) {
                    LandmarkRow(landmark: landmark).tag(landmark)
                }
            }
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList(
            selectedLandmark: .constant(landmarkData[0]),
            filter: .constant(.all)
        )
        .environmentObject(UserData())
    }
}
