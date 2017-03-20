//
//  FirstViewController.swift
//  To Do 2.0
//
//  Created by Tony Nikolov on 3/20/17.
//  Copyright © 2017 Tony Nikolov. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var mTableView: UITableView!
    var tasks: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         initTasks()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return getTasksFromLocalDb().count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = tasks[indexPath.row]

        return (cell)

    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle==UITableViewCellEditingStyle.delete{
            deleteTask(index: indexPath.row)
            mTableView.reloadData()
        }
    }
    
    func getStringFromLocalDb(key: String) -> String{
        let str = UserDefaults.standard.object(forKey: key)
        
        if let strObj = str as? String {
            return strObj
        }
        // no data for that key is stored currently
        return ""
    }
    
    override func viewDidAppear(_ animated: Bool) {
        initTasks()
        mTableView.reloadData()
    }
    
    func getTasksFromLocalDb() -> [String] {
        let defaults = UserDefaults.standard
        let storedTasks = defaults.object(forKey:"tasks") as? [String] ?? [String]()
        
        return storedTasks
    }
    
    func initTasks(){
        tasks = getTasksFromLocalDb()			
    }
    
    func deleteTask(index: Int){
        tasks.remove(at: index)
        let defaults = UserDefaults.standard
        
        defaults.set(tasks, forKey: "tasks")
        defaults.synchronize()
        
    }
    
}

