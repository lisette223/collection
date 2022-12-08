//
//  CollectionViewCell.swift
//  collection
//
//  Created by Lisette Antigua on 12/8/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
@IBOutlet weak var itemLabel:UILabel!
@IBOutlet weak var selectLabel:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectLabel.layer.cornerRadius = 15
        self.selectLabel.layer.masksToBounds = true
        self.selectLabel.layer.borderColor = UIColor.white.cgColor
        self.selectLabel.layer.borderWidth = 1.0
        self.selectLabel.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
    }
}
