//
//  LoginApi.swift
//  DependancyInversion
//
//  Created by Rushikesh Potdar on 24/01/23.
//

import Foundation

protocol LoginProtocol{
    func authonticateUser(currentUser : User)
}

class LoginApi: LoginProtocol{
 
    func authonticateUser(currentUser : User){
        // api code to authonticate user
        print(" this user is printed in LoginApi class \(currentUser.userId) , \(currentUser.name)")
    }
    
}
