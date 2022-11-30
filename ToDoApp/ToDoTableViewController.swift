//
//  ToDoTableViewController.swift
//  ToDoApp
//
//  Created by Боб rep1q on 29.11.2022.
//

import UIKit

class ToDoTableViewController: UITableViewController {

    
    var objects = [
        ToDo(Logo: "Hi", Title: "Name: Bob", Subscription: "Surname: Not Stupid Man", isFavourite: false, isDone: false),
        ToDo(Logo: "HUI", Title: "Name: Poshel", Subscription: "Surname: NaHUI", isFavourite: false, isDone: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.title = "I NEED TO DO GLIcK GLIcK"
        self.navigationItem.leftBarButtonItem = self.editButtonItem
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return objects.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoCell", for: indexPath) as! CellTableViewCell
        
        let object = objects[indexPath.row]
        cell.set(object:object)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete{
            objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedCell = objects.remove(at: sourceIndexPath.row)
        objects.insert(movedCell, at: destinationIndexPath.row)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let done = doneAction(at: indexPath)
        let favourite = favouriteAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [done, favourite])
    }
   
    func doneAction(at indexPath: IndexPath)->UIContextualAction{
        var object = objects[indexPath.row]
        let action = UIContextualAction(style: .destructive, title: "Done") { action, view, completion in
            object.isDone = !object.isDone
            self.objects[indexPath.row] = object
//            self.objects.remove(at: indexPath.row)
//            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
        }
        action.backgroundColor = .systemGreen
        action.image = object.isDone ? UIImage(systemName: "circle") : UIImage(systemName: "checkmark.circle")
        return action
    }
    
    func favouriteAction(at indexPath: IndexPath) -> UIContextualAction{
        var object = objects[indexPath.row]
        let action = UIContextualAction(style: .normal, title: "Favourite") { action, view, completion in
            object.isFavourite = !object.isFavourite
            self.objects[indexPath.row] = object
            completion(true)
        }
        action.backgroundColor = object.isFavourite ? .systemPurple: .systemGray
        action.image = UIImage(systemName: "heart")
        return action
    }
    
}
