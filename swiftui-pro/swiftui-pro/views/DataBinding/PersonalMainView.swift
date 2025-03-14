//
//  PersonalMainView.swift
//  swiftui-pro
//
//  Created by lw h on 2025/3/13.
//

import SwiftUI
import SwiftData

struct PersonalMainView: View {
    var sharedModelContainer: ModelContainer = {
           let schema = Schema([
               Item.self,
           ])
           let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

           do {
               return try ModelContainer(for: schema, configurations: [modelConfiguration])
           } catch {
               fatalError("Could not create ModelContainer: \(error)")
           }
       }()
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
        .modelContainer(sharedModelContainer)
        
    }
}

#Preview {
    PersonalMainView()
}
