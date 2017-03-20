//
//  SecondViewController.swift
//  To Do 2.0
//
//  Created by Tony Nikolov on 3/20/17.
//  Copyright © 2017 Tony Nikolov. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var mTaskInput: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onAddNowTapped(_ sender: Any) {
        
        
        let str: String = mTaskInput.text!
        if str != ""{
        saveStringToLocalDb(string: str)
        mTaskInput.text=""
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override  func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
    func saveStringToLocalDb(string: String?){
        let defaults = UserDefaults.standard
        
        var storedTasks = defaults.object(forKey:"tasks") as? [String] ?? [String]()
        
        if let stringObj = string
        {
            storedTasks.append(stringObj)
        }
    
        defaults.set(storedTasks, forKey: "tasks")
        defaults.synchronize()
    }
    
    
}

