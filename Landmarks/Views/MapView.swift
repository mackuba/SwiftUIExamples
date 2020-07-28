//
//  MapView.swift
//  Landmarks
//
//  Created by Kuba Suder on 28.07.2020.
//  Copyright © 2020 Kuba Suder. All rights reserved.
//

import MapKit
import SwiftUI

struct MapView: UIViewRepresentable {
    var coordinate: CLLocationCoordinate2D

    func makeUIView(context: Context) -> MKMapView {
        return MKMapView(frame: .zero)
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        let region = MKCoordinateRegion(center: coordinate, span: span)

        uiView.setRegion(region, animated: false)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        let coordinate = landmarkData[0].locationCoordinate
        return MapView(coordinate: coordinate)
    }
}
