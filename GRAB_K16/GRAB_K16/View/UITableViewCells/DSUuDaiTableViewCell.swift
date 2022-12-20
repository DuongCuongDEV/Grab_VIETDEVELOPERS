//
//  DSUuDaiTableViewCell.swift
//  GRAB_K16
//
//  Created by Thanh Dat on 20/12/2022.
//

import UIKit

class DSUuDaiTableViewCell: UITableViewCell {
    
    
    @IBOutlet var lblTenUuDai: UILabel!
    @IBOutlet var lblSoTienGiam: UILabel!
    
    @IBOutlet var btnSuDung: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
