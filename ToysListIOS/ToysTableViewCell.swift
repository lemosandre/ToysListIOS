//
//  ToysTableViewCell.swift
//  ToysListIOS
//
//  Created by Andre Lemos on 2021-09-04.
//

import UIKit

class ToysTableViewCell: UITableViewCell {

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labrelConservation: UILabel!
    @IBOutlet weak var labelNameOwner: UILabel!
    @IBOutlet weak var labelPhone: UILabel!
    @IBOutlet weak var labelAddress: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureWith(_ toysItem: ToysItem) {
        labelName?.text = toysItem.name
        labrelConservation?.text = toysItem.conservation
        labelNameOwner?.text = toysItem.nameOwner
        labelAddress?.text = toysItem.address
        labelPhone?.text = "\(toysItem.phone)"
    }

}
