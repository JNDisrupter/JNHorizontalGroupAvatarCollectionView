//
//  SelectionTableViewCell.swift
//  JNHorizontalGroupAvatarCollectionView_Example
//
//  Created by JNDisrupter on 2/25/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import JNGroupAvatarImageView

/// Selection Table View Cell
class SelectionTableViewCell: UITableViewCell {
    
    /// Avatar image view
    @IBOutlet weak var avatarImageView: JNGroupAvatarImageView!
    
    /// Avatar name
    @IBOutlet weak var avatarNameLabel : UILabel!

    /// Icon image view
    @IBOutlet weak var iconImageView : UIImageView!

    /**
     Draw
     */
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        // Round avatar image view
        self.avatarImageView.layer.cornerRadius = self.avatarImageView.frame.height / 2
        self.avatarImageView.clipsToBounds = true
    }
    
    /**
     Setup
     */
    func setup(name: String, avatars: [JNGroupAvatar], iconImage: UIImage?) {
        
        // Set user name
        self.avatarNameLabel.text = name
        
        // Setup avatar image
        self.avatarImageView.setup(avatars: avatars, placeHolderImage : UIImage(named: "empty-avatar"))
        
        // Set selection icon
        self.iconImageView.image = iconImage
    }
    
    // MARK: - Class methods
    
    /**
     Get reuse identifier
     - Returns : Resuse identifier
     */
    class func getReuseIdentifier() -> String {
        return "SelectionTableViewCell"
    }
    
    /**
     Get cell height
     - Returns : Cell height
     */
    class func getCellHeight() -> CGFloat {
        return 80
    }
}
