//
//  TripsTableViewCell.swift
//  Grab
//
//  Created by Huy on 07/12/2022.
//

import UIKit

class TripsTableViewCell: UITableViewCell {

    @IBOutlet weak var imgCustomerAvatar: UIImageView!
    
    @IBOutlet weak var lblCustomerName: UILabel!
    
    @IBOutlet weak var lblTripDistance: UILabel!
    
    @IBOutlet weak var lblTripProfit: UILabel!
    
    @IBOutlet weak var lblDropOffPlace: UILabel!
    
    @IBOutlet weak var lblPickUpPlace: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
