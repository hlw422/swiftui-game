//
//  DetailSceneView.swift
//  swiftui-pro
//
//  Created by lw h on 2025/3/4.
//

import SwiftUI

struct DetailSceneView: View {
    var body: some View {
        VStack{
            MapView().frame(height: 300)
            GreateWallView().offset(y:-130).padding(.bottom,-130)
            
            VStack(alignment:.leading){
                Text("长城").font(.title)
                HStack{
                    Text("北京市")
                    Spacer();
                    Text("中国")
                }
                Divider()
                Text("关于长城").font(.title2)
                Spacer()
                Text("长城，作为世界建筑史上的奇迹，承载着数千年的历史沧桑与厚重文化。它宛如一条蜿蜒盘旋的巨龙，横卧在中国北方的崇山峻岭之间，绵延万里，气势磅礴")
            }.padding()
        }
    }
}

#Preview {
    DetailSceneView()
}
