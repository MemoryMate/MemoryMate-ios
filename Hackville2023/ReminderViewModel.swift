//
//  ReminderViewModel.swift
//  Hackville2023
//
//  Created by Chris Couto on 2023-02-12.
//

import Foundation

struct Reminder: Codable, Identifiable {
    
    var _id: String
    var id: String {
        _id
    }
    var senderName: String = ""
    var senderImage: String = ""
    var isReoccuring: Bool = false
    var title: String = ""
    var category: String = ""
    var notes: String = ""
    var time: String = ""
    var sendTo: String = ""
    var __v : Int = 0
    
    
    
}

class ReminderViewModel: ObservableObject {
    
    // properties
    @Published var reminders: [Reminder] = [] // publish it to SwiftUI
    
    // fetch data using closure
    func fetchData(id: String){
        
        //build URL from string
        let urlString = "http://10.80.5.31:3000/api/users/reminders/\(id)"
        guard let url = URL(string: urlString) else {
            print("Cannot create URL")
            return
        }
        //print(url.absoluteString)
        
        // create URLSession task
        let task = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in
            // 1. first check error
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            //2. check data
            guard let data = data else {
                print("Data is nil")
                return
            }
            
            print(data)
            //3. parse JSON
            if let json = try? JSONDecoder().decode([Reminder].self, from: data){
                //success
                DispatchQueue.main.async {
                    // update GUI in main thread
                    self.reminders = json
                    dump(json)
                }
                
            } else {
                
                print("Fail to parse JSON")
            }
            
        })
        //finally perform the task
        task.resume()
        
    }
    
    func fetchData2() async {
        
        let urlString = "hhttp://10.80.5.31/api/users"
        guard let url = URL(string: urlString) else {
            print("Cannot create URL froms string")
            return
        }
        
        do {
            
            //1. request URLsession data with await
            // NOTE: the subsequent code will wait until it is done
            let ss = URLSession.shared
            let (data,response) = try await ss.data(from: url)
            
            //2. check response
            guard let response = response as? HTTPURLResponse,
                  response.statusCode == 200 else {
                      print("HTTP Request failed")
                      return
                  }
            
            //3. parse JSON
            let decoder = JSONDecoder()
            let json = try decoder.decode([Reminder].self, from: data)
            //success, update data in main thread
            DispatchQueue.main.async {
                self.reminders = json
                //dump(json)
            }
            
        } catch {
            print("Cannot load JSON")
        }
        
    }
    
    
    
}

