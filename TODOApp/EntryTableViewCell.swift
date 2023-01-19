//
//  EntryTableViewCell.swift
//  TODOApp
//
//  Created by Cubastion on 19/01/23.
//

import UIKit

class EntryViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textfield : UITextField!
    
    var update : (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textfield.delegate = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(EntryViewController.save))
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        save()
        return true
    }
    
    @objc func save() {
        guard let field = textfield.text, !field.isEmpty else {
            return 
        }
        
        guard let count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }
        
        let newCount = count + 1
        UserDefaults().set(newCount, forKey: "count")
        UserDefaults().set(field, forKey: "task_\(newCount)")
        update?()
        self.navigationController?.popViewController(animated: true)
    }
}
