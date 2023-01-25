//
//  APICaller.swift
//  APIKit
//
//  Created by Rushikesh Potdar on 17/01/23.
//

import Foundation

public class APICaller {
    public static let shared = APICaller()
    
    private init(){
        
    }
    
    public func fetchCourseNames(completion : @escaping ([String])-> Void){
        guard let url = URL(string: "https://iosacademy.io/api/v1/courses/index.php") else {
            completion([])
            return
        }
        let task = URLSession.shared.dataTask(with: url) { serverdata, _, error in
            guard let data = serverdata, error == nil else{ completion([])
                return
            }
            
            //Decode
            
            do {
                
                let jsonData = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [[String:String]]
                //print(jsonData)
                let arr : [String] = jsonData.compactMap({$0["name"]})
                completion(arr)
            }
            catch{
                completion([])
            }
            
        }
        task.resume()
    }
}

