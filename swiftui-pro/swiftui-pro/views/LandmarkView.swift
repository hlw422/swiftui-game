//
//  LandmarkView.swift
//  swiftui-pro
//
//  Created by lw h on 2025/3/6.
//

import SwiftUI

struct LandmarkView: View {
    @State private var landmarks:[Landmark]=[]
    
    
    var body: some View {
        NavigationView{
            List(landmarks){
                landmark in
                HStack{
                    Image(landmark.imageName)
                        .resizable()
                        .frame(width: 50,height: 50)
                    Text(landmark.name)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
            }
            .navigationTitle("景点")
        }.onAppear{
            loadLandmarks()
        }
    }
    
    func loadLandmarks(){
        guard let url=Bundle.main.url(forResource:"LandmarkData",withExtension: "json")
        else{
            return
        }
        do{
            let data=try Data(contentsOf: url)
            
            landmarks=try JSONDecoder().decode([Landmark].self,from : data)
            
        }
        catch{
            print("loading error");
        }
    }
}

#Preview {
    LandmarkView()
}
