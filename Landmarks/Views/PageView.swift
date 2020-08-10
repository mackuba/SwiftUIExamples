//
//  PageView.swift
//  Landmarks
//
//  Created by Kuba Suder on 10.08.2020.
//  Copyright © 2020 Kuba Suder. All rights reserved.
//

import SwiftUI

struct PageView<Page: View>: View {
    var viewControllers: [UIHostingController<Page>]
    @State var currentPage = 0

    init(_ views: [Page]) {
        self.viewControllers = views.map { UIHostingController(rootView: $0) }
    }

    var body: some View {
        VStack {
            /*Button(action: {
                self.currentPage = (self.currentPage + 1) % self.viewControllers.count
            }) {
                Text("Change image")
            }*/

            PageViewController(controllers: viewControllers, currentPage: $currentPage)

            Text("Current page: \(currentPage)")
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(features.map { FeatureCard(landmark: $0) })
            .aspectRatio(3/2, contentMode: .fit)
    }
}
