//
//  User.swift
//  JNHorizontalGroupAvatarCollectionView_Example
//
//  Created by JNDisrupter on 2/25/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import JNGroupAvatarImageView
import UIKit

// User
class User: JNGroupAvatar {

    var name = ""

    var imageUrl = ""
    
    // MARK:- JN Group Avatar protocol
    
    func getGroupAvatarDisplayName() -> String {
        return self.name
    }
    
    func getGroupAvatarImageUrl() -> String {
        return self.imageUrl
    }
    
    func getGroupAvatarImage() -> UIImage? {
        return nil
    }
}
