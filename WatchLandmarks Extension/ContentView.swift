//
//  ContentView.swift
//  WatchLandmarks Extension
//
//  Created by Kuba Suder on 11.08.2020.
//  Copyright © 2020 Kuba Suder. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList() { WatchLandmarkDetail(landmark: $0) }
            .environmentObject(UserData())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
