//
//  CoreDataManager.swift
//  Hackville2023
//
//  Created by Roop Malhans on 2023-02-12.
//

import Foundation
import CoreData

class CoreDataManager{
    
    let persistentContainer: NSPersistentContainer
    
    init(){
        persistentContainer = NSPersistentContainer(name:"UserModel")
        persistentContainer.loadPersistentStores{ (description, error) in
            if let error = error {
                fatalError("Core Data failed to store \(error.localizedDescription)")
            }
            
        }
    }
    
    func getAllUsers() -> [User]{
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        
        do{
           return try persistentContainer.viewContext.fetch(fetchRequest)
        }catch{
            return []
        }
    }
    func saveUser(firstName:String, lastName:String, userName: String, password:String){
        let user = User(context: persistentContainer.viewContext)
        user.firstName = firstName
        user.lastName = lastName
        user.userName = userName
        user.password = password
        do{
            try persistentContainer.viewContext.save()
        }catch{
            fatalError("Failed to save \(error.localizedDescription)")
            //print("Failed to save ")
        }
    }
}
