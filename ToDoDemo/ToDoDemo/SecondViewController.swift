//
//  SecondViewController.swift
//  ToDoDemo
//
//  Created by Tony Nikolov on 3/19/17.
//  Copyright © 2017 Tony Nikolov. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var mAddButton: UIButton!
    @IBOutlet weak var mAddToDoTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onAddToDoClicked(_ sender: Any) {
        let toDo = String(mAddToDoTextField.text!)
        mAddToDoTextField.text=""
        print("add item")
        mToDoList.append(toDo!)
    }

}

