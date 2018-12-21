//
//  ViewController.swift
//  Clear
//
//  Created by Sri Kyru Cabading on 22/12/2018.
//  Copyright © 2018 Sri Kyru Cabading. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    let itemArray = ["Find Mike", "Buy Eggos", "Destroy Demogorgon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //MARK - Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let todo = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        todo.textLabel?.text = itemArray[indexPath.row]
        return todo
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    //MARK - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Todo Add/Remove Checkbox logic
        let selectedTodo = tableView.cellForRow(at: indexPath)
        let isSelectedTodoDone = selectedTodo?.accessoryType == .checkmark
        
        if (isSelectedTodoDone) {
            selectedTodo?.accessoryType = .none
        } else {
            selectedTodo?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

