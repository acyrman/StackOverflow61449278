//
//  ViewController.swift
//  SO 61449278
//
//  Created by acyrman on 4/26/20.
//  Copyright © 2020 iCyrman. All rights reserved.
//

import UIKit

class ViewController: UIViewController, WeatherDataProtocol {
   func responseDataHandler(data: NSDictionary) {
      DispatchQueue.main.async { [weak self] in
         self?.dataTextView.text = "\(data)"
      }
   }
   
   func responseError(message: String) {
      DispatchQueue.main.async { [weak self] in
         self?.dataTextView.text = "\(message)"
      }
   }
   
   @IBOutlet weak var dataNumberTextField: UITextField!
   @IBOutlet weak var dataTextView: UITextView!
   fileprivate let wd = WeatherData()
   
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view.
      
      wd.delegate = self
      
   }

   @IBAction func fetchData(_ sender: UIButton) {
      guard let dataNumber = dataNumberTextField.text else {
         return
      }
      dataNumberTextField.resignFirstResponder()
      wd.getData(exampleDataNumber: dataNumber)
   }
   
}

