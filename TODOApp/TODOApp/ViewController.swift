//
//  ViewController.swift
//  TODOApp
//
//  Created by Cubastion on 19/01/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var addBtn: UIButton!
    
    var tableview : UITableView = {
        let table = UITableView()
        let cellNib = UINib(nibName: "TableViewCell", bundle: nil)
        table.register(cellNib, forCellReuseIdentifier: TableViewCell.id)
        return table
    }()
    
    var Taskarray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableview)
        tableview.delegate = self
        tableview.dataSource = self
        addBtn.addTarget(self, action: #selector(addbtnAction(_ :)), for: .touchUpInside)
        
        if !UserDefaults().bool(forKey: "setup") {
            UserDefaults().set(true, forKey: "setup")
            UserDefaults().set(0, forKey: "count")
        }
        
        updateTask()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableview.frame = self.view.bounds
    }
    
    func updateTask(){
        
        Taskarray.removeAll()
        
        guard let count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }
        
        for x in 0..<count {
            if let task = UserDefaults().value(forKey: "task_\(x+1)") as? String {
                Taskarray.append(task)
            }
            
        }
        
        tableview.reloadData()
    }
    
    @objc func addbtnAction(_ sender: UIBarButtonItem) {
        let entryVC = self.storyboard?.instantiateViewController(withIdentifier: "entry") as! EntryViewController
        entryVC.title = "New Task"
        entryVC.update = {
            DispatchQueue.main.async {
                self.updateTask()
            }
        }
        self.navigationController?.pushViewController(entryVC, animated: true)
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Taskarray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.id) as! TableViewCell
        cell.textlabel.text = Taskarray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let taskVC = self.storyboard?.instantiateViewController(withIdentifier: "task") as! TaskviewController
        taskVC.task = Taskarray[indexPath.row]
        self.navigationController?.pushViewController(taskVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

