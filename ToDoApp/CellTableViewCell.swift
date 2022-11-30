//
//  CellTableViewCell.swift
//  ToDoApp
//
//  Created by Боб rep1q on 30.11.2022.
//

import UIKit

class CellTableViewCell: UITableViewCell {

    @IBOutlet weak var logo: UILabel!
    @IBOutlet weak var Title: UILabel!
    @IBOutlet weak var SubScription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func set(object: ToDo){
        self.logo.text = object.Logo
        self.Title.text = object.Title
        self.SubScription.text = object.Subscription
    }
}
