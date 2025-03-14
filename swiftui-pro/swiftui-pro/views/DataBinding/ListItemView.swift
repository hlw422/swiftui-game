//
//  ListItemView.swift
//  swiftui-pro
//
//  Created by lw h on 2025/3/13.
//

import SwiftUI
import SwiftData

struct ListItemView: View {
    @Environment(\.modelContext) var modelContext;
    @Query private var items:[Item]
    var body: some View {
        List{
            ForEach(items){
                person in
                HStack{
                    Text(person.name)
                    Text(" - ")
                    Text(person.phone)
                }
                
            }
        }.navigationTitle("所有用户记录")
        
    }
}

#Preview {
    ListItemView()
}
