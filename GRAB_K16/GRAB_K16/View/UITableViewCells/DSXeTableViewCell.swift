//
//  DSXeTableViewCell.swift
//  GRAB_K16
//
//  Created by Thanh Dat on 19/12/2022.
//

import UIKit

class DSXeTableViewCell: UITableViewCell {
    
    
    @IBOutlet var lblTenXe: UILabel!
    @IBOutlet var lblGiaTien: UILabel!
    @IBOutlet var lblSoLuongHanhKhach: UILabel!
    @IBOutlet var lblThoiGianDi: UILabel!
    @IBOutlet var anhXe: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
