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
            
            HStack{
                
                Label("Reminder Title", systemImage: "star.fill" )
                
            }
            
            HStack{
                Text("Sender: ")
                AsyncImage(url: URL(string: "https://randomuser.me/api/portraits/women/80.jpg"))
                    .frame(width: 70, height: 70)
                                .background(Color.gray)
                                .clipShape(Circle())
                Text("Nancy Jane")
            }
            
            HStack{
                
                Text("Category: ")
                AsyncImage(url: URL(string: "https://cdn-icons-png.flaticon.com/512/4003/4003833.png"), scale: 10)
                    .frame(width: 40, height: 40)
                                .background(Color.white)
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
        .background(.gray)
        .cornerRadius(50)
    }
}

struct ReminderExt_Previews: PreviewProvider {
    static var previews: some View {
        ReminderExt()
    }
}
