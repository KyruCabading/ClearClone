//
//  ViewController.swift
//  Clear
//
//  Created by Sri Kyru Cabading on 22/12/2018.
//  Copyright © 2018 Sri Kyru Cabading. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var todoList = ["Find Mike", "Buy Eggos", "Destroy Demogorgon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //MARK - Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let todo = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        todo.textLabel?.text = todoList[indexPath.row]
        return todo
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
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
    
    //MARK - Add New Items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var todoTextField = UITextField()
        
        let todoAlert = UIAlertController(title: "Add New item", message: "", preferredStyle: .alert)
       
        let addItemAlertAction = UIAlertAction(title: "Add Item", style: .default) { (action) in
            self.todoList.append(todoTextField.text!)
            self.tableView.reloadData()
        }
        
        todoAlert.addTextField { (todoAlertTextField) in
            todoAlertTextField.placeholder = "Create new Item..."
            todoTextField = todoAlertTextField
        }
        
        todoAlert.addAction(addItemAlertAction)
        present(todoAlert, animated: true, completion: nil)
    }
}

