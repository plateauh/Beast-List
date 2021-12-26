//
//  ViewController.swift
//  NajedBeastList
//
//  Created by Najd Alsughaiyer on 25/12/2021.
//

import UIKit

class ViewController: UIViewController, BeastCellDelegate {
    
    func showTaskDescription(description: String) {
        textLabel.text = description
    }
    

    // Create this array at the top of your class as a property
    var tasks = ["Exercise for 30 minutes", "Wireframe for some project", "Do laundry"]
    
    @IBAction func beastButtonPressed(_ sender: UIButton) {
        if !(textField.text?.isEmpty ?? false) {
            tasks.append(textField.text ?? "None")
            tableView.reloadData()
            textField.text = ""
        }
    }
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        textLabel.text = ""
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {

    // How many cells are we going to need?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    // How should I create each cell?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! CustomCell
        cell.textLabel?.text = tasks[indexPath.row]
        cell.delegate = self
        return cell
    }
    
    // What we write here will be implemented as soon as one of the table view cells are tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tasks.remove(at: indexPath.row)
        tableView.reloadData()
    }


}

