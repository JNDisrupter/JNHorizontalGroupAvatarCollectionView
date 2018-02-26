//
//  AvatarCollectionViewCell.swift
//  JNHorizontalGroupAvatarCollectionView
//
//  Created by JNDisrupter on 2/22/18.
//

import UIKit
import JNGroupAvatarImageView

/// Avatar Collection View Cell
class AvatarCollectionViewCell: UICollectionViewCell {
    
    /// Avatar image view
    @IBOutlet private weak var avatarImageView: JNGroupAvatarImageView!

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
     Setup view
     - parameter avatars: The array of avatars to draw the maximum number of avatars is 4 if provided more than 4 the first 4 will be used
     - parameter imagesLayoutDirection: The images layout direction
     - parameter avatarsMargin: The margin between avatars default is 0.0
     - parameter placeHolderImage: Place holder image default is nil
     - parameter separatorColor: The Separator color
     - parameter showInitails: boolean to indicate if the initials should show if the image is failed, default is false
     - parameter initialsFont: The font to use for initials
     - parameter initialTextColor: The text color to use for initials
     */
    public func setup(avatars : [JNGroupAvatar], imagesLayoutDirection: ImagesLayoutDirection, avatarsMargin: CGFloat, separatorColor: UIColor, placeHolderImage: UIImage!, showInitails: Bool, initialsFont: UIFont, initialTextColor: UIColor) {
        
        self.avatarImageView.setup(avatars: avatars, imagesLayoutDirection : imagesLayoutDirection, avatarsMargin: avatarsMargin, separatorColor: separatorColor, placeHolderImage: placeHolderImage, showInitails: showInitails, initialsFont: initialsFont, initialTextColor: initialTextColor)
    }
    
    // MARK: - Class methods
    
    /**
     Get reuse identifier
     - Returns : Resuse identifier
     */
    class func getReuseIdentifier() -> String {
        return "AvatarCollectionViewCell"
    }
}
