//
//  TableViewCell.swift
//  TODOApp
//
//  Created by Cubastion on 19/01/23.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var textlabel: UILabel!
    static let id = "TableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
