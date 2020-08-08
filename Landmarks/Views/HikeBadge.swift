//
//  HikeBadge.swift
//  Landmarks
//
//  Created by Kuba Suder on 08.08.2020.
//  Copyright © 2020 Kuba Suder. All rights reserved.
//

import SwiftUI

struct HikeBadge: View {
    var name: String
    var body: some View {
        VStack(alignment: .center) {
            Badge()
                .frame(width: 300, height: 300)
                .scaleEffect(1.0 / 3.0)
                .frame(width: 100, height: 100)

            Text(name)
                .font(.caption)
                .accessibility(label: Text("Badge for \(name)"))
        }
    }
}

struct HikeBadge_Previews: PreviewProvider {
    static var previews: some View {
        HikeBadge(name: "First 6-thousander")
    }
}
