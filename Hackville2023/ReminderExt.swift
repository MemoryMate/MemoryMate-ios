//
//  ReminderExt.swift
//  Hackville2023
//
//  Created by Chris Couto on 2023-02-11.
//

import SwiftUI

struct ReminderExt: View {
    var body: some View {
        VStack{
            
            

            Label("Reminder Title", systemImage: "star.fill" ).padding(.bottom,100)
                
            Image("avatar")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200,height: 200)
                .cornerRadius(150)
            
            HStack{
                Text("Sender: ")
                Image(systemName:"person.crop.circle")
                                
                Text("Nancy Jane")
            }
            
            HStack{
                
                Text("Category: ")
                Image(systemName:"stethoscope")
                Text("Health")
                
                
            }
            
            HStack{
                Text("Time ")
                Text(Date.now, style: .date)
                Text(Date.now, style: .time)
            
            }.frame(width: 325, height: 40)
                .background(Color.white)
                .cornerRadius(10)
            
            HStack{
                
            }
        }
        .frame(width:350,height: 600)
        .background(Color(uiColor: UIColor(red: 225/255, green: 218/255, blue: 209/255, alpha: 1)))
        .cornerRadius(50)
    }
}

struct ReminderExt_Previews: PreviewProvider {
    static var previews: some View {
        ReminderExt()
    }
}
