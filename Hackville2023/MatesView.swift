//
//  MatesView.swift
//  Hackville2023
//
//  Created by Chris Couto on 2023-02-11.
//

import Foundation
import SwiftUI


struct MatesView: View {
    
    // properties
    @State var phoneNum: String = "19056165625"
    
    @State var presentAlert: Bool
    
    // properties
    @StateObject var vm: MateViewModel = MateViewModel()
    
    
    var body: some View {
        
        VStack {
            
            Image("matespageimage")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 170,height: 170)
                .clipped()
                .cornerRadius(150)
                .padding(.bottom,20)
            
            
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

                
                Button("Invite", action: {
                    
                    //if let phone = phoneNum {
                    print(phoneNum)
                    
                    let url = URL(string: "http://10.80.5.31:3000/api/users/invite/63e82910911dec2cc4f0f65a/\(phoneNum)")!
                    
                    var request = URLRequest(url: url)
                    
                    let task = URLSession.shared.dataTask(with: url) { data, response, error in
                        if let data = data {
                            print("There is data")
                            print(response)
                        } else if let error = error {
                            print("HTTP Request Failed \(error)")
                        }
                    }
                    task.resume()
                    
                //}
                })
                
                Button("Cancel", role: .cancel, action: {})
            }, message: {
                Text("Please enter the phone number of the person you would like to invite to be your mate.")
            })
            
            
        }.onAppear(){
            vm.fetchData(id: "63e82910911dec2cc4f0f65a")
        }
        
    }
    
}





struct MatesView_Previews: PreviewProvider {
    static var previews: some View {
        MatesView(phoneNum: "", presentAlert: false)
    }
}
