//
//  PersonalMainView.swift
//  swiftui-pro
//
//  Created by lw h on 2025/3/13.
//

import SwiftUI

struct PersonalMainView: View {
    var body: some View {
        NavigationStack{
            VStack(spacing:20){
                Text("swift-ui 数据库编程")
                    .font(.title2)
                    .bold()
                NavigationLink(destination:NewItemView()){
                    Text("新建记录")
                        .frame(width: 360,height: 50)
                        .font(.title2)
                        .background(Color.blue)
                        .cornerRadius(5)
                        .foregroundColor(.white)
                }
                NavigationLink(destination:ListItemView()){
                    Text("查看记录")
                        .frame(width: 360,height: 50)
                        .font(.title2)
                        .background(Color.blue)
                        .cornerRadius(5)
                        .foregroundColor(.white)
                }
            }
        }
        
    }
}

#Preview {
    PersonalMainView()
}
