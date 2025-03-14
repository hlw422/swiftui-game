//
//  NewItemView.swift
//  swiftui-pro
//
//  Created by lw h on 2025/3/13.
//

import SwiftUI

struct NewItemView: View {
    @State var myName:String=""
    @State var myPhone:String=""
    // 用于触发跳转的状态变量
    @State private var navigateToDetail: Bool = false
    
    @Environment(\.modelContext) var modelContext
    
    var body:some View{
        VStack{
            Text("个人信息记录")
                .font(.title)
                .bold()
            
            TextField("请输入你的名字",text:$myName)
                .padding()
                .overlay{// overlay 作用是把一个 RoundedRectangle（圆角矩形）叠加在 TextField 上。但因为这个 RoundedRectangle 是透明的（只是有 stroke 边框），它表现出来的效果就是给 TextField 加了个灰色边框。
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.gray,lineWidth: 1)//stroke 相当于给图形加了“外轮廓线”。如果你不加 .stroke，RoundedRectangle 本身默认是没有颜色和边框显示的。
                    
                }.padding()
            TextField("请输入你的电话号码",text:$myPhone)
                .padding()
                .overlay{// overlay 作用是把一个 RoundedRectangle（圆角矩形）叠加在 TextField 上。但因为这个 RoundedRectangle 是透明的（只是有 stroke 边框），它表现出来的效果就是给 TextField 加了个灰色边框。
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.gray,lineWidth: 1)//stroke 相当于给图形加了“外轮廓线”。如果你不加 .stroke，RoundedRectangle 本身默认是没有颜色和边框显示的。
                    
                }.padding()
            
            Button(action:{
                print(myName+" "+myPhone)
                createNewPerson()
            }){
                Text("新建记录")
                    .font(.title2)
                    .foregroundColor(.white)
            }
            .frame(width: 360,height: 50)
            .background(Color.blue)
            .cornerRadius(5)
            // 隐藏的 NavigationLink，当 navigateToDetail 为 true 时自动触发跳转
            NavigationLink(destination: ListItemView(), isActive: $navigateToDetail) {
                EmptyView()
            }
            
        }.navigationTitle("新建记录")//其他页面点进来时会显示这个 title
    }
    
    func createNewPerson(){
        if myName != "" && myPhone != ""{
            let newperson=Item(name: myName, phone: myPhone)
            modelContext.insert(newperson);//新建记录
            navigateToDetail = true         // 触发导航跳转
        }
        else{
            print("名字和电话号码不能为空")
        }
    }
    
}

#Preview {
    NewItemView()
}
