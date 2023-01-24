//
//  LoginViewModel.swift
//  DependancyInversion
//
//  Created by Rushikesh Potdar on 24/01/23.
//

import Foundation

class LoginViewModel {
    
    private let loginApi : LoginProtocol
    
    init(_loginApi : LoginProtocol){
        self.loginApi = _loginApi
    }
    
    func authonticateUser(currentUser : User){
        loginApi.authonticateUser(currentUser: currentUser) // calling the authonticate api
    }
}
