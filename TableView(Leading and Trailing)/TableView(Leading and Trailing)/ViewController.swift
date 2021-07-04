//
//  ViewController.swift
//  TableView(Leading and Trailing)
//
//  Created by Mac on 05/05/2021 / india.
//

import UIKit

class ViewController: UIViewController {

    var cityArray: [String] = ["Pune","Jalgaon","Satara","Osmanabad","Agra"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = cityArray[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let editAction = UIContextualAction(style: .normal, title: "Edit") { (editAct, view, nil) in
            let ac = UIAlertController(title: "Edit City", message: "", preferredStyle: .alert)
            ac.addTextField(configurationHandler: nil)
            
            let submit = UIAlertAction(title: "Submit", style: .default) { (act) in
                let ans = ac.textFields?[0].text
                tableView.beginUpdates()
                self.cityArray[indexPath.row] = ans!
                tableView.reloadData()
                tableView.endUpdates()
            }
            ac.addAction(submit)
            self.present(ac, animated: true, completion: nil)
        }
        return UISwipeActionsConfiguration(actions: [editAction])
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {  (deleteAct, view, nil) in
            
            tableView.beginUpdates()
            
            self.cityArray.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            tableView.endUpdates()
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}
