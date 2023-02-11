//
//  MatesView.swift
//  Hackville2023
//
//  Created by Chris Couto on 2023-02-11.
//

import Foundation
import SwiftUI

struct User: Identifiable {
    
    var id: String = ""
    var firstName: String = ""
    var lastName: String = ""
    var image: String = ""
    var isLoggedIn = false
    
}



struct MatesView: View {
    
    // properties
    @State var phoneNum: String
    
    @State var presentAlert: Bool
    
    // properties
    @StateObject var vm: MateViewModel = MateViewModel()
    
//
//    let john = User(firstName: "John", lastName: "Doe", image: "https://randomuser.me/api/portraits/men/21.jpg")
//    let rich = User(firstName: "Richard", lastName: "Brauer", image: "https://randomuser.me/api/portraits/men/24.jpg")
//    let ric = User(firstName: "Ric", lastName: "Lee", image: "https://randomuser.me/api/portraits/men/22.jpg")
//    let joan = User(firstName: "Joan", lastName: "Mcgee", image: "https://randomuser.me/api/portraits/women/24.jpg")
//    let alice = User(firstName: "Alice", lastName: "Lansdown", image: "https://randomuser.me/api/portraits/women/22.jpg")
//    let megan = User(firstName: "Megan", lastName: "Nguyen", image: "https://randomuser.me/api/portraits/women/23.jpg")
//
    
    var body: some View {
        
        VStack {
            
            List(vm.mates) { m in
                VStack {
                    
                    Text("\(m.firstName) \(m.lastName)")
                        .font(.headline)
                    
                    
                }
                
            }
            .navigationTitle("Mates (\(vm.mates.count))")
            
            Button(action: {
                presentAlert = true
            }, label: {
                Label("Invite", systemImage: "arrowshape.turn.up.right.circle.fill")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width:240,height: 60)
                    .background(.green)
                    .cornerRadius(5.0)
            })
            .alert("Invite A Mate", isPresented: $presentAlert, actions: {
                TextField("Phone #:", text: $phoneNum)

                
                Button("Invite", action: {})
                Button("Cancel", role: .cancel, action: {})
            }, message: {
                Text("Please enter the phone number of the person you would like to invite to be your mate.")
            })
            
            
        }
        
    }
    
}





struct MatesView_Previews: PreviewProvider {
    static var previews: some View {
        MatesView(phoneNum: "", presentAlert: false)
    }
}
