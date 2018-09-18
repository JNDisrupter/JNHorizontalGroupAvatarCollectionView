//
//  JNAvatarWithInitials.swift
//  JNAvatarWithInitials
//
//  Created by JN Disrupter on 9/13/17.
//  Copyright © 2017 JN Disrupter. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

/// Image completion block
public typealias ImageCompletionBlock = (UIImage?, Error? , URL?) -> Void

/// Avatar with initilas on it if needed
open class JNAvatarWithInitials: UIView {
    
    /// Initials label
    @IBOutlet private weak var initialsLabel: UILabel!
    
    /// Avatar image
    @IBOutlet private weak var avatarImage: UIImageView!
    
    /// Intial Label Top Constraint
    @IBOutlet private weak var initialLabelTopConstraint: NSLayoutConstraint!
    
    /// Intial Label Bottom Constraint
    @IBOutlet private weak var initialLabelBottomConstraint: NSLayoutConstraint!
    
    /// Initials font
    open var initialsFont = UIFont.systemFont(ofSize: 14) {
        didSet {
            
            // Set font
            self.initialsLabel.font = self.initialsFont
            
            // Call display
            self.setNeedsDisplay()
        }
    }
    
    /// Initials text color
    open var initialTextColor = UIColor.black {
        didSet {
            
            // Set text color
            self.initialsLabel.textColor = initialTextColor
            
            // Call display
            self.setNeedsDisplay()
        }
    }
    
    /// Initials label insets
    open var initialLabelInset = UIEdgeInsets.zero {
        didSet {
            
            // Set Top Constraint
            self.initialLabelTopConstraint.constant = initialLabelInset.top
            
            // Set Bottom Constraint
            self.initialLabelBottomConstraint.constant = initialLabelInset.bottom
            
            // Call display
            self.layoutIfNeeded()
        }
    }
    
    /// Avatar content mode
    open var avatarContentMode : UIView.ContentMode = UIView.ContentMode.scaleAspectFill {
        didSet {
            
            // Set image content mode
            self.avatarImage.contentMode = self.avatarContentMode
            
            // Call display
            self.setNeedsDisplay()
        }
    }
    
    /**
     Loads a view instance from the xib file
     - returns: loaded view
     */
    private func loadViewFromXibFile() -> UIView {
        let bundle = Bundle(for: JNAvatarWithInitials.self)
        let nib = UINib(nibName: "JNAvatarWithInitials", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        view.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        return view
    }
    
    /**
     Default initializer
     */
    convenience init() {
        self.init(frame: CGRect())
    }
    
    /**
     Initialiser method with frame
     */
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Setup view
        self.setupView()
    }
    
    /**
     Initialiser method with NSCoder
     */
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Setup view
        self.setupView()
    }
    
    /**
     Sets up the view by loading it from the xib file and setting its frame
     */
    private func setupView() {
        let view = loadViewFromXibFile()
        view.frame = bounds
        self.addSubview(view)
        
        // Add constarins to view
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        view.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        view.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        
        // Setup view
        self.clipsToBounds = true
        self.initialsLabel.textAlignment = .center
        
        // Reset view
        self.resetView()
    }
    
    /**
     Layout subviews
     */
    override open func layoutSubviews() {
        super.layoutSubviews()
        
        // Get Min Value between Width and Height and update font to fit view
        let fontSize = min(self.frame.size.height , self.frame.size.width) / 3
        self.initialsLabel.font = initialsFont.withSize(fontSize)
    }
    
    /**
     Setup view
     - parameter imageUrl: The image url to load
     - parameter placeHolderImage: Place holder image
     - parameter fullName: Full name which will be used to set initials
     - parameter showInitails: boolean to indicate if the initials should appear
     */
    open func setup(imageUrl : String , placeHolderImage : UIImage! = nil , fullName : String , showInitails : Bool = false , completion : ImageCompletionBlock? = nil) {
        
        // Reset view
        self.resetView()
        
        // Set iamge view content mode
        self.avatarImage.contentMode = self.avatarContentMode
        
        // hide name label
        self.initialsLabel.isHidden = true
        
        // Check if image url is empty
        if !imageUrl.isEmpty {
            
            // Setup avatar image
            self.avatarImage.sd_setShowActivityIndicatorView(true)
            self.avatarImage.sd_setIndicatorStyle(UIActivityIndicatorView.Style.gray)
            self.avatarImage.sd_setImage(with: URL(string:imageUrl), placeholderImage: placeHolderImage, options: SDWebImageOptions.continueInBackground, completed: { (image, error,  cacheType, imageURL) in
                
                if error != nil {
                    
                    if showInitails {
                        
                        // Show initialis
                        self.showInitials(fullName: fullName)
                    } else {
                        
                        // Set placeholder image
                        self.avatarImage.image = placeHolderImage
                    }
                }
                
                // Call completion
                if let completion = completion {
                    completion(self.avatarImage.image,error,imageURL)
                }
            })
        } else if showInitails {
            
            // Show initialis
            self.showInitials(fullName: fullName)
            
            // Call completion
            if let completion = completion {
                completion(nil,nil,nil)
            }
        } else {
            
            // Set placeholder image
            self.avatarImage.image = placeHolderImage
            
            // Call completion
            if let completion = completion {
                completion(placeHolderImage,nil,nil)
            }
        }
    }
    
    /**
     Setup view
     - parameter image: The uiimage to load
     - parameter placeHolderImage: Place holder image
     - parameter fullName: Full name which will be used to set initials
     - parameter showInitails: boolean to indicate if the initials should appear
     */
    open func setup(image : UIImage? , placeHolderImage : UIImage! = nil , fullName : String , showInitails : Bool = false , completion : ImageCompletionBlock? = nil) {
        
        // Reset view
        self.resetView()
        
        // Set iamge view content mode
        self.avatarImage.contentMode = self.avatarContentMode
        
        // hide name label
        self.initialsLabel.isHidden = true
        
        // Get image from image name
        if let image = image {
            
            // Set image
            self.avatarImage.image = image
        } else if showInitails {
            
            // Show initialis
            self.showInitials(fullName: fullName)
        } else {
            
            // Set placeholder image
            self.avatarImage.image = placeHolderImage
        }
        
        // Call completion
        if let completion = completion {
            completion(self.avatarImage.image,nil,nil)
        }
    }
    
    /**
     Reset view
     */
    private func resetView() {
        
        // Reset image
        self.avatarImage.image = nil
        
        // Reset intialis label
        self.initialsLabel.isHidden = true
        self.initialsLabel.text = ""
    }
    
    /**
     Show Initials
     - parameter fullName: The full name
     */
    private func showInitials(fullName : String) {
        
        // Reset image
        self.avatarImage.image = nil
        
        // Trim full name and separat it by space
        let displayNameArray = fullName.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).components(separatedBy: " ")
        
        // Build initails text
        var initialsString = ""
        
        if !displayNameArray.isEmpty {
            
            if displayNameArray.count == 1 && displayNameArray[0].count > 1 {
                let index = displayNameArray[0].index(displayNameArray[0].startIndex, offsetBy: 2)
                initialsString = String(displayNameArray[0][..<index])
            }
                
                // Check if there is first and last name
            else if displayNameArray.count > 1 {
                if let firstCharacter = displayNameArray.first?.first , let secondCharachter = displayNameArray.last?.first {
                    initialsString = String(describing: firstCharacter) + String(describing: secondCharachter)
                }
            }
        }
        
        // Set initials text
        self.initialsLabel.text = initialsString.uppercased()
        
        // Show initials Label
        self.initialsLabel.isHidden = false
    }
}
