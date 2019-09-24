//
//  ViewController.swift
//  DecodableTasks
//
//  Created by Mohamed on 9/24/19.
//  Copyright © 2019 Mohamed74. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let url:String = "https://api.letsbuildthatapp.com/jsondecodable/course"
    
    let url2:String = "https://api.letsbuildthatapp.com/jsondecodable/courses"
    
    let url3:String = "https://api.letsbuildthatapp.com/jsondecodable/website_description"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // simpleExampleLowLevel(url)
        
        //simpleExampleArrayLevel(url2)
        
        midumExampleArrayLevel(url3)

}


struct Courses:Decodable{
    
    var id:Int
    var name:String
    var link:String
    var imageUrl:String
    
    
}
    
    struct User:Decodable{
        
        var name:String
        var description:String
        var courses:[Courses]
        
    }

    func simpleExampleLowLevel(_ url:String){
        
        guard let url = URL(string: url) else {return}
        
        
        URLSession.shared.dataTask(with: url) { (data, rseponse, error) in
            
            do{
                
                let jsonDecoder = try JSONDecoder().decode(Courses.self
                    , from: data!)
                
                print(jsonDecoder.name)
                print(jsonDecoder.id)
                print(jsonDecoder.imageUrl)
                
            }catch let error{
                
                print(error)
            }
            }.resume()
        
        
        
    }
    
    func simpleExampleArrayLevel(_ url:String){
        
        guard let url = URL(string: url) else {return}
        
        
        URLSession.shared.dataTask(with: url) { (data, rseponse, error) in
            
            do{
                
                let jsonDecoder = try JSONDecoder().decode([Courses].self
                    , from: data!)
                
                for i in jsonDecoder{
                    
                    print(i.name)
                }
                
            }catch let error{
                
                print(error)
            }
            }.resume()
        
        
        
    }
    
    func midumExampleArrayLevel(_ url:String){
        
        guard let url = URL(string: url) else {return}
        
        
        URLSession.shared.dataTask(with: url) { (data, rseponse, error) in
            
            do{
                
                let jsonDecoder = try JSONDecoder().decode(User.self
                    , from: data!)
                
                print(jsonDecoder.name , jsonDecoder.description)
                
                
            }catch let error{
                
                print(error)
            }
            }.resume()
        
        
    }
    
  
        
}

