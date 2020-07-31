//
//  BadgeBackground.swift
//  Landmarks
//
//  Created by Kuba Suder on 31.07.2020.
//  Copyright © 2020 Kuba Suder. All rights reserved.
//

import SwiftUI

struct BadgeBackground: View {
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let fullWidth: CGFloat = min(geometry.size.width, geometry.size.height)
                let height = fullWidth
                let xScale: CGFloat = 0.832
                let xOffset = (fullWidth * (1.0 - xScale)) / 2.0
                let width = fullWidth * xScale

                path.move(to: CGPoint(
                    x: xOffset + width * 0.95,
                    y: height * (0.20 + HexagonParameters.adjustment)
                ))

                for point in HexagonParameters.points {
                    path.addLine(to: CGPoint(
                        x: xOffset + width * point.useWidth.0 * point.xFactors.0,
                        y: height * point.useHeight.0 * point.yFactors.0
                    ))

                    path.addQuadCurve(
                        to: CGPoint(
                            x: xOffset + width * point.useWidth.1 * point.xFactors.1,
                            y: height * point.useHeight.1 * point.yFactors.1
                        ), control: CGPoint(
                            x: xOffset + width * point.useWidth.2 * point.xFactors.2,
                            y: height * point.useHeight.2 * point.yFactors.2
                        )
                    )
                }
            }.fill(LinearGradient(
                gradient: Gradient(colors: [Self.gradientStart, Self.gradientEnd]),
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 0.6)
            ))
            .aspectRatio(1.0, contentMode: .fit)
        }
    }

    static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
}

struct BadgeBackground_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBackground()
    }
}
