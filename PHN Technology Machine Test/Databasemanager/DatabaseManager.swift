//
//  DatabaseManager.swift
//  PHN Technology Machine Test
//
//  Created by Mac on 21/04/23.
//

import Foundation
import CoreData
protocol UserRepository{
    func create(user : User)
    func get(by email : String) -> User?
}

struct UserDBRepository : UserRepository{
    func create(user: User) {
        let cdUser = CDUser(context: PersistantStorage.shared.context)
        cdUser.username = user.username
        cdUser.email = user.email
        cdUser.password = user.password
        PersistantStorage.shared.saveContext()
    }
    
    func get(by email : String) -> User? {
        var user : User?
        
        let result = getCDUser(by: email)
        user = User(username: result?.username, email: result?.email, password: result?.password)
        return user
    }
    
    private func getCDUser(by email : String) -> CDUser?{
        var cdUser : CDUser?
        let fetchRequest = NSFetchRequest<CDUser>(entityName: "CDUser")
        let predicate = NSPredicate(format: "email==%@", email as CVarArg)
        fetchRequest.predicate = predicate
        do{
            let result = try PersistantStorage.shared.context.fetch(fetchRequest).first
            cdUser = result
        }catch let error{
            print(error.localizedDescription)
        }
        return cdUser
    }
    }
