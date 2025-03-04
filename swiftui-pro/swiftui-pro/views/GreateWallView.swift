//
//  GreateWallView.swift
//  swiftui-pro
//
//  Created by lw h on 2025/3/4.
//

import SwiftUI

struct GreateWallView: View {
    var body: some View {
        Image("greatewall").resizable().scaledToFit().clipShape(Circle())
            .overlay{
                Circle().stroke(.gray,lineWidth: 4)
            }
            .shadow(radius:7)
    }
}

#Preview {
    GreateWallView()
}
