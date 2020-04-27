//
//  WeatherData.swift
//  SO 61449278
//
//  Created by acyrman on 4/26/20.
//  Copyright © 2020 iCyrman. All rights reserved.
//

import Foundation

class WeatherData {
   private let urlSession = URLSession.shared
   private let urlPathBase = "https://api.worldweatheronline.com/premium/v1/weather.ashx?key=efcc8b6300354517b08194421202604&format=json&q="
   
   private var dataTask:URLSessionDataTask? = nil
   
   var delegate:WeatherDataProtocol? = nil
   
   init() {
   }
   
   func getData(exampleDataNumber: String){
      
      var urlPath = self.urlPathBase
      urlPath = urlPath + exampleDataNumber
      
      let url:NSURL? = NSURL(string: urlPath)
      print(url!)
      
      let dataTask = self.urlSession.dataTask(with: url! as URL) {(data, response, error) -> Void in
         if error != nil {
            print(error!)
         } else {
            do {
               let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
               if jsonResult != nil {
                  print(jsonResult)
                  let temperature_c = jsonResult?.value(forKeyPath: "data.current_condition.temp_C") as Any
                  
                  if temperature_c != nil {
                     self.delegate?.responseDataHandler(data: jsonResult!)
                  } else {
                     self.delegate?.responseError(message: "Fake data not found")
                  }
               } else {
                  print("Fake data")
               }
            } catch {
               print("Error")
            }
         }
      }.resume()
      
   }
   
   
   
   
   
}
