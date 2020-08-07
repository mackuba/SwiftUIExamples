//
//  CategoryRow.swift
//  Landmarks
//
//  Created by Kuba Suder on 02.08.2020.
//  Copyright © 2020 Kuba Suder. All rights reserved.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Landmark]

    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 15)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(self.items) { landmark in
                        CategoryItem(landmark: landmark)
                    }
                }
            }
            .frame(height: 185)
            .padding(.bottom, 10)
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(
            categoryName: landmarkData[0].category.rawValue,
            items: Array(landmarkData.prefix(5))
        )
    }
}

struct CategoryItem: View {
    var landmark: Landmark

    var body: some View {
        VStack(alignment: .leading) {
            landmark.image
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(8)

            Text(landmark.name)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}
