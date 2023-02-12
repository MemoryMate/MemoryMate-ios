//
//  MateViewModel.swift
//  Hackville2023
//
//  Created by Chris Couto on 2023-02-11.
//

import Foundation


struct Mate: Codable, Identifiable {
    
    var id: String = ""
    var firstName: String = ""
    var lastName: String = ""
    var image: String = ""
    var isLoggedIn = false
    var mates: [Mate] = []
    
}

class MateViewModel: ObservableObject {
    
    // properties
    @Published var mates: [Mate] = [] // publish it to SwiftUI
    
    // fetch data using closure
    func fetchData(){
        
        //build URL from string
        let urlString = "http://google.com"
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
            
            //3. parse JSON
            if let json = try? JSONDecoder().decode([Mate].self, from: data){
                //success
                DispatchQueue.main.async {
                    // update GUI in main thread
                    self.mates = json
                    //dump(json)
                }
                
            } else {
                
                print("Fail to parse JSON")
            }
            
        })
        //finally perform the task
        task.resume()
        
        
    }
    
    func fetchData2() async {
        
        let urlString = "http://google.com"
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
            let json = try decoder.decode([Mate].self, from: data)
            //success, update data in main thread
            DispatchQueue.main.async {
                self.mates = json
                //dump(json)
            }
            
        } catch {
            print("Cannot load JSON")
        }
        
    }
    
    
    
}
