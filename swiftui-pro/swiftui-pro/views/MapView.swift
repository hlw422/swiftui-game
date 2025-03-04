//
//  MapView.swift
//  swiftui-pro
//
//  Created by lw h on 2025/3/4.
//

import SwiftUI
import MapKit

struct MapView: View {
    var body: some View {
        //地图展示
        Map(initialPosition: .region(region));
    }
    //北京地图
    private var region:MKCoordinateRegion{
        MKCoordinateRegion(
            //经纬度配置  31.81379911021578, 119.95902004694102
            center:CLLocationCoordinate2D(latitude:39.904179,
                                          longitude:116.40737),
            //精度值
            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        )
    }
}

#Preview {
    MapView()
}
