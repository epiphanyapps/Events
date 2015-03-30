//
//  UserCell.swift
//  Events
//
//  Created by Walter Martin Vargas-Pena on 3/29/15.
//  Copyright (c) 2015 Epiphany Apps. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var thumbnailHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var thumbnailWidthConstraint: NSLayoutConstraint!
    
    class func UserCellIdentifier() -> String {
        return "UserCell"
    }
    
    class func UserThumbnailWidth() -> Int {
    return 75;
    }

    override func prepareForReuse() {
        //
    }
    override func awakeFromNib() {
        self.thumbnailImageView.layer.cornerRadius = CGFloat(UserCell.UserThumbnailWidth()/2)
        self.thumbnailImageView.layer.masksToBounds = true
        
    }
}