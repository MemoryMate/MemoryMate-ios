//
//  ReminderView.swift
//  Hackville2023
//
//  Created by Roop Malhans on 2023-02-11.
//

import SwiftUI
import AVFoundation

struct ReminderView: View {
    @State var selectedDate: Date = Date()
    var closedRange = Calendar.current.date(byAdding:.year,value:-1,to:Date())
    @State private var reminderDescription:String = ""
    @State var notes:String = ""
    @State var sendTo:String = ""
    let categories = ["Activities", "Heath", "Task", "Feelings", "Appointments"]
    let recurring = ["Never","Weekly", "Monthly", "Yearly"]
    @State private var selection = "Health"
    @State private var selection2 = 0
 
    var body: some View {
        ScrollView{
            Text("Create a Reminder").bold().font(.system(size: 30))
            VStack(alignment: .leading, spacing: 5){
                HStack{
                    Text("Select a category")
                    Picker("", selection: $selection){
                        ForEach(categories, id:\.self){
                            Text($0)
                        }
                    }.pickerStyle(.menu).padding()
                }.background(Color(.systemGray6))
                    .cornerRadius(5.0)
                    .padding(.bottom,20)
            }.frame(width: .infinity, alignment: .leading).padding(.leading,10.0)
                
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
            
            
                
                VStack() {
                    Text("Pick a Date").frame(alignment: .leading)
                    DatePicker("Select Date", selection: $selectedDate, displayedComponents: [.date])
                        .padding(.horizontal)
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .cornerRadius(5.0)
                        .background(Color(uiColor: UIColor(red: 196/255, green: 216/255, blue: 215/255, alpha: 1)))
                }
               
                
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
