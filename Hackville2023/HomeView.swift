//
//  HomeView.swift
//  Hackville2023
//
//  Created by Roop Malhans on 2023-02-11.
//

import SwiftUI
struct HomeView: View {
    let coreDM: CoreDataManager
    @State private var users: [User] = [User]()
    
    // properties
    @StateObject var rvm: ReminderViewModel = ReminderViewModel()

    var body: some View {

        ScrollView{
                VStack{
              
                        VStack(alignment: .leading, spacing: 5){
                            Image("logo").resizable()
                                .frame(width: 90.0, height: 90.0)
                                .cornerRadius(150)
                                .aspectRatio(contentMode: .fit)
                        }.frame(maxWidth: .infinity, alignment: .leading).padding(.leading,10.0)
                    VStack(alignment: .leading, spacing: 0){
                        NavigationLink(destination: ReminderView()){
                            Label("",systemImage: "person.3.sequence.fill").foregroundColor(Color.black).frame(width: 80,height: 50)
                        }
                    }.frame(maxWidth: .infinity, alignment: .trailing).padding(.leading,15.0)
                        
                    
                    Text("Today is \(Date.now, format: .dateTime.day().month().year())").bold().font(Font.subheadline).font(.system(size: 30))
                        .padding()
                    
                    Text("Tasks for today").frame(maxWidth: .infinity, alignment: .leading).fontWeight(.semibold).font(.system(size: 20)).padding(.leading,10.0)
                    List(rvm.reminders){ r in
                        NavigationLink("\(r.title)"){
                            ReminderExt(reminder: r)
                        }
                    }.frame(height: 200)
                    
                    Text("Completed").frame(maxWidth: .infinity, alignment: .leading).fontWeight(.semibold).font(.system(size: 20)).padding(.leading,10.0)
                    List{
                        Label("Take 9AM Pill", systemImage: "checkmark.circle.fill")
                        Label("1PM Doctor's Appointment", systemImage: "checkmark.circle.fill")
                        Label("Take Trash Out", systemImage: "checkmark.circle.fill")

                    }.frame(height: 200)
               
                    NavigationLink(destination: ReminderView()){
                       
                        Label("Set a Reminder", systemImage: "bell.fill").frame(width: 350,height: 50).background(Color(uiColor: UIColor(red: 131/255, green: 209/255, blue: 217/255, alpha: 1))).cornerRadius(15.0).foregroundColor(Color.black)
                       
                    }
                }
        }.onAppear(){
            self.users = coreDM.getAllUsers()
            rvm.fetchData(id: "63e82910911dec2cc4f0f65a")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(coreDM:CoreDataManager())
    }
}
