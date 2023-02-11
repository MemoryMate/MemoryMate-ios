//
//  ReminderView.swift
//  Hackville2023
//
//  Created by Roop Malhans on 2023-02-11.
//

import SwiftUI

struct ReminderView: View {
    @State var reminderDescription:String = ""
    @State var notes:String = ""
    @State var sendTo:String = ""
    let categories = ["Activities", "Heath", "Task", "Feelings", "Appointments"]
    let recurring = ["Never","Weekly", "Monthly", "Yearly"]
    @State private var selection = "Health"
    @State private var selection2 = 0
 
    var body: some View {
        VStack{
            Image("reminders")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 170,height: 170)
                .clipped()
                .cornerRadius(150)
                .padding(.bottom,20)
            
            
            Picker("Pick a suitable category", selection: $selection){
                ForEach(categories, id:\.self){
                    Text($0)
                }
            }.pickerStyle(.segmented).padding()
            
            TextField("Reminder Description",text: $reminderDescription)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(5.0)
                .frame(width:350)
                .padding(.bottom,20)
            
            TextField("Notes",text:  $notes)
                .padding().background(Color(.systemGray6))
                .cornerRadius(5.0)
                .frame(width:350)
                .padding(.bottom,20)
            
            TextField("Send To",text:  $sendTo)
                .padding().background(Color(.systemGray6))
                .cornerRadius(5.0)
                .frame(width:350)
                .padding(.bottom,20)
            
            VStack{
                Picker("Pick a suitable category", selection: $selection2){
                    ForEach(0 ..< recurring.count) {
                        Text(self.recurring[$0])
                    }
                }.pickerStyle(.segmented).padding()
                
            }
        }
    }
}

struct ReminderView_Previews: PreviewProvider {
    static var previews: some View {
        ReminderView()
    }
}
