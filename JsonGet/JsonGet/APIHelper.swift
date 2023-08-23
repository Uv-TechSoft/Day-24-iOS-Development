//
//  APIHelper.swift
//  JsonGet
//
//  Created by Yogesh Patel on 11/12/21.
//

import UIKit

class APIHelper{
    
    static let shareInstance = APIHelper()
    //() -> ()
    func calledCountryGetAPI(completionHandler: @escaping ([[String: AnyObject]]) -> ()){
        guard let url = URL(string: "http://api.countrylayer.com/v2/all?access_key=yourapikey") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            do {
                let jsonResponse = try JSONSerialization.jsonObject(with: data)
                if let jsonArray = jsonResponse as? [[String: AnyObject]]{
                   
                   completionHandler(jsonArray)
                }
            } catch{
                print(error.localizedDescription)
            }
        }.resume()
        
    }
    
    func capture(completion: (Int) -> ()){
        print("asdasd")
        completion(5)
    }
    
    func calledLocalJson(completionHandler: @escaping ([[String: AnyObject]]) -> ()){
        guard let countryJsonURL = Bundle.main.url(forResource: "CountryJson", withExtension: "json"), let data = try? Data(contentsOf: countryJsonURL) else { return }
        do {
            let jsonResponse = try JSONSerialization.jsonObject(with: data)
            if let jsonArray = jsonResponse as? [[String: AnyObject]]{
               completionHandler(jsonArray)
            }
        } catch{
            print(error.localizedDescription)
        }
    }
}
