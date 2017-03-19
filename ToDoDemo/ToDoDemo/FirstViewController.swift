//
//  FirstViewController.swift
//  ToDoDemo
//
//  Created by Tony Nikolov on 3/19/17.
//  Copyright © 2017 Tony Nikolov. All rights reserved.
//

import UIKit

var mToDoList = ["Eat Breakfast", "Workout", "Have lunch", "Sleep"]

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var mTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (mToDoList.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = mToDoList[indexPath.row]
        
        return (cell)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle==UITableViewCellEditingStyle.delete{
            mToDoList.remove(at: indexPath.row)
            mTableView.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        mTableView.reloadData()
    }
}

