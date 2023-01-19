//
//  TaskTableViewCell.swift
//  TODOApp
//
//  Created by Cubastion on 19/01/23.
//

import UIKit

class TaskviewController: UIViewController {
    
    @IBOutlet weak var label : UILabel!
    
    var task : String?

    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = task
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete task", style: .done, target: self, action: #selector(deleteTask))
    }
    
    @objc func deleteTask(){
//        let newCount = count - 1
//        UserDefaults().setValue(newCount, forKey: "count")
//        UserDefaults().set(nil, forKey: "task_\(newCount)")
    }

}
