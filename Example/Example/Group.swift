//
//  Group.swift
//  JNHorizontalGroupAvatarCollectionView_Example
//
//  Created by JNDisrupter on 2/26/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation

class Group {
    
    private var users: [User]
    
    /**
     Initializer
     */
    init(users: [User]) {
        self.users = users
    }
    
    /**
     Get Group Users
     - Returns : the group list of users
     */
    func getGroupName() -> String {
        
        var groupName = ""
        
        for (index, user) in self.users.enumerated() {
            groupName += user.name
            
            if index != self.users.count - 1 {
                groupName += ", "
            }
        }
        
        return groupName
    }
    
    /**
     Get Group Users
     - Returns : the group list of users
     */
    func getGroupUsers() -> [User] {
        return self.users
    }
}
