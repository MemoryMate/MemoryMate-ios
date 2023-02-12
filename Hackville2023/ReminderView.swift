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
    @State private var reminderDescription:String = ""
    @State var notes:String = ""
    @State var sendTo:String = ""
    let categories = ["Activities", "Heath", "Task", "Feelings", "Appointments"]
    let recurring = ["Never","Weekly", "Monthly", "Yearly"]
    @State private var selection = "Health"
    @State private var selection2 = 0
 
    var body: some View {
        ScrollView{
         //   VStack{
                
            
//                Button(action:{
//                    let utterance = AVSpeechUtterance(string:"You have set a reminder for :\(reminderDescription)")
//                    utterance.voice = AVSpeechSynthesisVoice(language: "en-AU")
//                    utterance.rate = 0.57
//                    utterance.pitchMultiplier = 0.8
//                    utterance.postUtteranceDelay = 0.2
//                    utterance.volume = 0.8
//                    let syntesizer = AVSpeechSynthesizer()
//                    syntesizer.speak(utterance)
//                }){
//                    Text("Listen")
//                }
//                }.frame(maxWidth: .infinity, alignment: .leading).padding(.leading,10.0)
            
            
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
                
                VStack() {
                    Text("Pick a Date").frame(alignment: .leading)
                    DatePicker("Select Date", selection: $selectedDate, displayedComponents: [.date])
                        .padding(.horizontal)
                        .datePickerStyle(.graphical)
                        .cornerRadius(5.0)
                        .background(Color(uiColor: UIColor(red: 196/255, green: 216/255, blue: 215/255, alpha: 1))
)
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
