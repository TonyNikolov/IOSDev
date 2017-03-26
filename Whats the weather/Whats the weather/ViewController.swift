//
//  ViewController.swift
//  Whats the weather
//
//  Created by Tony Nikolov on 3/21/17.
//  Copyright © 2017 Tony Nikolov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mInputField: UITextField!
    @IBOutlet weak var mCityForecastField: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onFindTapped(_ sender: Any) {
        
        let city: String = mInputField.text!
        if city != ""{
            getCityWeather(city: city)
        }
    }
    
    func getCityWeather(city: String){
        if let webView = URL(string:"http://www.weather-forecast.com/locations/\(city)/forecasts/latest"){
            let request = NSMutableURLRequest(url: webView)
            
            let task = URLSession.shared.dataTask(with: request as URLRequest){
                data,response,error in
                if(error != nil){
                    print(error!)
                } else{
                    if let unwrappedData = data {
                        let dataString = NSString(data:unwrappedData,encoding: String.Encoding.utf8.rawValue)
                        
                        print(dataString!)
                    }
                }
            }
            
            task.resume()
        }

    }
    
}

