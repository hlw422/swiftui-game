//
//  BasicLayoutView.swift
//  swiftui-pro
//
//  Created by lw h on 2025/3/4.
//

import SwiftUI

struct BasicLayoutView: View {
    var body: some View {
        GeometryReader{
            geometry in
            VStack(spacing:0){
                HStack(spacing:0){
                    ZStack(){
                        
                    }.frame(width: geometry.size.width/2,
                            height: geometry.size.height*0.3)
                    .background(.yellow)
                    
                    ZStack{
                        
                    }.frame(width: geometry.size.width/2,
                            height: geometry.size.height*0.3)
                    .background(.red)
                    
                }
             
                
                ZStack{
                    
                }.frame(width: geometry.size.width,
                        height: geometry.size.height*0.2)
                .background(.blue)
                
                ZStack{
                    
                }.frame(width: geometry.size.width,
                        height: geometry.size.height*0.5)
                .background(.green)
            }
        }
    }
}

#Preview {
    BasicLayoutView()
}
