//
//  UserData.swift
//  Landmarks
//
//  Created by Kuba Suder on 31.07.2020.
//  Copyright © 2020 Kuba Suder. All rights reserved.
//

import Combine
import Foundation

class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
    @Published var profile = Profile.default
}
