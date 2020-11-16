//
//  noteTableViewCell.swift
//  NoteN
//
//  Created by verrell rizky on 09/11/20.
//

import UIKit

class noteTableViewCell: UITableViewCell {
    
    @IBOutlet weak var txtTitle: UILabel!
    @IBOutlet weak var txtNotes: UILabel!
    @IBOutlet weak var txtCategory: UILabel!
    //celll

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
