//
//  ViewController.swift
//  CoreData Demo
//
//  Created by Tony Nikolov on 3/21/17.
//  Copyright © 2017 Tony Nikolov. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var mTextField: UITextField!
    @IBOutlet weak var mTextLabel: UILabel!
    @IBOutlet weak var mLogInButton: UIButton!
    
    var context: NSManagedObjectContext?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        do {
            let result = try context?.fetch(request)
            
            for res in result as! [NSManagedObject] {
                if let username = res.value(forKey: "username"){
                    mTextField.alpha = 0
                    mLogInButton.alpha = 0
                    mTextLabel.text = username as? String
                }
            }
            
        } catch {
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onLogInClicked(_ sender: Any) {
        let user = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context!)
        let username = mTextField.text
        
        if username != nil{
            
        user.setValue(username, forKey: "username")
            do {
                try context?.save()
                
                print("sucess")
                
            } catch {
                print("failed")
            }
        }
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "users")
        request.returnsObjectsAsFaults = false
    }
}

