//
//  ViewController.swift
//  Todoey
//
//  Created by emre halis on 5.03.2019.
//  Copyright © 2019 emre halis. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController{

    var  itemArray = [Item]()
    
    var defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "Find Mike"
        itemArray.append(newItem)
        
        
        let newItem2 = Item()
        newItem2.title = "save the world!"
        itemArray.append(newItem2)
        
        
        let newItem3 = Item()
        newItem3.title = "take  the dog out"
        itemArray.append(newItem3)
        
        
        let newItem4 = Item()
        newItem4.title = "run everyday"
        itemArray.append(newItem4)
        
        
        
        if let items = defaults.array(forKey: "ToDoListArray") as? [Item] {
            itemArray = items
        }
}
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = itemArray[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = item.title
        
            // Ternary operator ==>
            // Value = condition ? valueIfTrue : valueIFFalse
        
        cell.accessoryType = item.done ? .checkmark : .none
        
  
        return cell
    }
    
    //MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
  
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK - Add New Items
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            // What will happen once the user clicks the Add Item button on our UIAlert
        let newItem = Item()
        newItem.title = textField.text!
            
            
        self.itemArray.append(newItem)
            
        self.defaults.set(self.itemArray, forKey: "ToDoListArray")
            
        self.tableView.reloadData()
        
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
            
           
            
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
    
}

