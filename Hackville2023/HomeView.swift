//
//  HomeView.swift
//  Hackville2023
//
//  Created by Roop Malhans on 2023-02-11.
//

import SwiftUI

struct HomeView: View {

    var body: some View {
        ScrollView{
            VStack{
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 170,height: 170)
                    .clipped()
                    .cornerRadius(150)
                    .padding(.bottom,75)
                
                Text("Today is \(Date.now, format: .dateTime.day().month().year())").bold().font(Font.subheadline)
                    .font(.system(size: 36))
                    .padding()
                
                Text("Tasks for today")
                List{
                    Text("Do laundary")
                    Text("Get groceries")
                    Text("Walk the Dog")
                }.frame(height: 200)
                
                Text("Completed")
                
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
