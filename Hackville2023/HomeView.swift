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
                    VStack(alignment: .leading, spacing: 5){
                        Image("logo").resizable()
                            .frame(width: 90.0, height: 90.0)
                            .cornerRadius(150)
                            .aspectRatio(contentMode: .fit)
                    }.frame(maxWidth: .infinity, alignment: .leading).padding(.leading,10.0)
                    
                    Text("Today is \(Date.now, format: .dateTime.day().month().year())").bold().font(Font.subheadline).font(.system(size: 30))
                        .padding()
                    
                    Text("Tasks for today").frame(maxWidth: .infinity, alignment: .leading).fontWeight(.semibold).font(.system(size: 20)).padding(.leading,10.0)
                    List{
                        Text("Do laundary")
                        Text("Get groceries")
                        Text("Walk the Dog")
                    }.frame(height: 200)
                    
                    Text("Completed").frame(maxWidth: .infinity, alignment: .leading).fontWeight(.semibold).font(.system(size: 20)).padding(.leading,10.0)
                    List{
                        Label("Take 9AM Pill", systemImage: "checkmark.circle.fill")
                        Label("1PM Doctor's Appointment", systemImage: "checkmark.circle.fill")
                        Label("Take Trash Out", systemImage: "checkmark.circle.fill")

                    }.frame(height: 200)
                    
                    NavigationLink(destination: ReminderView()){
                        
                        Label("Set a Reminder", systemImage: "bell.fill").frame(width: 350,height: 50).background(Color(uiColor: UIColor(red: 225/255, green: 218/255, blue: 209/255, alpha: 1))).cornerRadius(15.0).foregroundColor(Color.black)
                       
                    }
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
