//
//  ReminderExt.swift
//  Hackville2023
//
//  Created by Chris Couto on 2023-02-11.
//

import SwiftUI

struct ReminderExt: View {
    
    var reminder: Reminder
    
    var body: some View {
        VStack{
            

            Label("\(reminder.title)", systemImage: "star.fill" ).padding(.bottom, 35).font(.title)
                
//            Image("avatar")
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .frame(width: 200,height: 200)
//                .cornerRadius(150)
            
            AsyncImage(url: URL(string: reminder.senderImage))
                .frame(width: 150,height: 150)
                .cornerRadius(150)
                .aspectRatio(contentMode: .fit)
            
            
            HStack{
                Text("Sender: ")
                Image(systemName:"person.crop.circle")
                                
                Text("\(reminder.senderName)")
            }
            
            HStack{
                
                Text("Category: ")
                Image(systemName:"stethoscope")
                Text("\(reminder.category)")
                
                
            }
            
            HStack{
                Text("Time ")
                Text(reminder.time)
                //Text(Date.now, style: .time)
            
            }.frame(width: 325, height: 40)
                .background(Color.white)
                .cornerRadius(10)
            
            HStack{
                VStack{
                    Label("Notes", systemImage: "rectangle.and.pencil.and.ellipsis" )
                    Text(reminder.notes)
                }
            }
        }
        .frame(width:350,height: 600)
        .background(Color(uiColor: UIColor(red: 225/255, green: 218/255, blue: 209/255, alpha: 1)))
        .cornerRadius(50)
    }
}

//struct ReminderExt_Previews: PreviewProvider {
//    static var previews: some View {
//        ReminderExt(reminder: Reminder())
//    }
//}
