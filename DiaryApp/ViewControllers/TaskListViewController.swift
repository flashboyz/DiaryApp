//
//  TaskListViewController.swift
//  DiaryApp
//
//  Created by Константин Прокофьев on 23.08.2021.
//

import RealmSwift

class TaskListViewController: UITableViewController {
    
    private var taskList: Results<TaskList>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskList = StorageManager.shared.realm.objects(TaskList.self)
//        createTestData()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        taskList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskListCell", for: indexPath)
        let taskList = taskList[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = taskList.name
        content.secondaryText = "\(taskList.tasks.count)"
        cell.contentConfiguration = content
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let taskList = taskList[indexPath.row]
        
        guard let tasksVC = segue.destination as? TasksViewController else { return }
        tasksVC.taskList = taskList
    }
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        showAlert()
    }
    
    @IBAction func sortingList(_ sender: UISegmentedControl) {
    }
    
    private func createTestData() {
        let shoppingList = TaskList()
        shoppingList.name = "ShoppingList"
        
        let moviesList = TaskList(value: ["Movies List", Date(), [["Best film ever"], ["The best of the best", "Must have", Date(), true]]])
        
        let milk = Task()
        milk.name = "Milk"
        milk.note = "2L"
        
        let bread = Task(value: ["Bread", "", Date(), true])
        let apples = Task(value: ["name": "Apples", "note": "2Kg"])
        
        shoppingList.tasks.append(milk)
        shoppingList.tasks.insert(contentsOf: [bread, apples], at: 0)
        
        DispatchQueue.main.async {
            StorageManager.shared.save(taskList: [shoppingList, moviesList])
        }
    }
}


//MARK: - Extension

extension TaskListViewController {
    
    private func showAlert() {
        let alert = UIAlertController.createAlert(withTitle: "New List", andMessage: "Please insert new value")
        
        alert.action { newValue in
            
        }
        
        present(alert, animated: true)
    }
    
}
