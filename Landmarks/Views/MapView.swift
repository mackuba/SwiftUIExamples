//
//  MapView.swift
//  Landmarks
//
//  Created by Kuba Suder on 28.07.2020.
//  Copyright © 2020 Kuba Suder. All rights reserved.
//

import MapKit
import SwiftUI

struct MapView {
    var coordinate: CLLocationCoordinate2D

    func makeMapView() -> MKMapView {
        return MKMapView(frame: .zero)
    }

    func updateMapView(_ view: MKMapView, context: Context) {
        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        let region = MKCoordinateRegion(center: coordinate, span: span)

        view.setRegion(region, animated: false)
    }
}

#if os(macOS)
extension MapView: NSViewRepresentable {
    func makeNSView(context: Context) -> MKMapView {
        return makeMapView()
    }

    func updateNSView(_ nsView: MKMapView, context: Context) {
        updateMapView(nsView, context: context)
    }
}
#else
extension MapView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        return makeMapView()
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        updateMapView(uiView, context: context)
    }
}
#endif

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        let coordinate = landmarkData[0].locationCoordinate
        return MapView(coordinate: coordinate)
    }
}
