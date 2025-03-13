//
//  CountView.swift
//  swiftui-pro
//
//  Created by lw h on 2025/3/13.
//

import SwiftUI

struct CountView: View {
    @State var count=0
    var body: some View {
        VStack{
            Text("Counter:\(count)")
            Button("Increase"){
                count+=1
            }
            .onChange(of: count){
                oldValue,newValue in
                print("\(oldValue) Counter changed to \(newValue)")
            }
        }
    }
}

#Preview {
    CountView()
}
