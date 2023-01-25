//
//  ViewController.swift
//  DependancyInversion
//
//  Created by Rushikesh Potdar on 17/01/23.
//
import APIKit
import UIKit
import MyAppUIKit

extension APICaller : DataFetchable{
    
}

class ViewController: UIViewController {

    @IBAction func loadCoursesBtn(_ sender: UIButton) {
        //let vc = CoursesViewController(dataFetchable: DataFetchable)
        let vc = CoursesViewController(dataFetchable: APICaller.shared)
        present(vc , animated: true)
    }
    
    let lgvm = LoginViewModel(_loginApi: LoginApi())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //https://iosacademy.io/api/v1/courses/index.php
        lgvm.authonticateUser(currentUser: User(userId: 1015028, name: "Potdar"))
    }
    
}
