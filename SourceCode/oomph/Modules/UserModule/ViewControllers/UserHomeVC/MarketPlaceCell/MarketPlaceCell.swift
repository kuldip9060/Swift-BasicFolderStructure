//
//  MarketPlaceCell.swift
//  KrishiSanchar
//
//  Created by Appuno Solutions on 24/04/19.
//  Copyright © 2019 Ecosmob. All rights reserved.
//

import UIKit

class MarketPlaceCell: UICollectionViewCell {
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var lblProductPrice: UILabel!
    
    var modal : MarketPlaceModel? {
        didSet{
            if let tempModal = modal {
                lblProductName.text = tempModal.name
                lblProductPrice.text = tempModal.price
            }
        }
    }
}
