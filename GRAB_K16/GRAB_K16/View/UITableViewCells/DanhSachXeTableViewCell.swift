//
//  DanhSachXeTableViewCell.swift
//  GRAB_K16
//
//  Created by Thanh Dat on 12/12/2022.
//

import UIKit

class DanhSachXeTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet var lblGiaTien: UILabel!
    @IBOutlet var imgCar: UIImageView!
    @IBOutlet var lblSoNguoi: UILabel!
    @IBOutlet var lblCarName: UILabel!
    
    @IBOutlet var lblvnd: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
