//
//  StarWarsService.swift
//  AulaIOS02
//
//  Created by aluno on 01/07/17.
//  Copyright © 2017 aluno. All rights reserved.
//

import Foundation


class StarWarsServices {

    enum ServiceResult {
        
        case sucess(model: NSArray)
        case failure(error: String)
    }
    
    func getAllPeople(urlDaString: String, completionHandler: @escaping (ServiceResult) -> (Void) ) {
        
        let url = URL(string: urlDaString)
        
        URLSession.shared.dataTask(with: url!){ (data, response, error) in
            
            if (error != nil) {
            
                
            
            }else{
                
                do{
                    let downloadData = try JSONSerialization.jsonObject(with: data!) as! [String: Any]
                    let results: NSArray = downloadData["results"] as! NSArray
                
                    completionHandler(.sucess(model: results))
                } catch let error as NSError {
                    completionHandler(.failure(error: "Deu ruim"))
                }
            }
        }.resume()
    }

}
