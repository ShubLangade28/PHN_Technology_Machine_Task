//
//  UserDBViewModel.swift
//  PHN Technology Machine Test
//
//  Created by Mac on 21/04/23.
//

import Foundation
struct UserManager{
    private let userDBRepository : UserRepository
    init(userDBRepository : UserRepository) {
        self.userDBRepository = userDBRepository
    }
    func create(user : User){
        return userDBRepository.create(user: user)
    }
    func getUser(by email : String) -> User?{
        return userDBRepository.get(by: email)
    }
}
