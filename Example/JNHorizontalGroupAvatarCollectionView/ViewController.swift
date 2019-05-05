//
//  ViewController.swift
//  JNHorizontalGroupAvatarCollectionView
//
//  Created by ali.hamad@yahoo.com on 02/22/2018.
//  Copyright (c) 2018 ali.hamad@yahoo.com. All rights reserved.
//

import UIKit
import JNHorizontalGroupAvatarCollectionView
import JNGroupAvatarImageView

/// View Controller
class ViewController: UIViewController {

    /// Table view
    @IBOutlet weak var tableView: UITableView!
    
    /// Horizontal Group Avatar Collection View
    @IBOutlet weak var horizontalGroupAvatarCollectionView: JNHorizontalGroupAvatarCollectionView!
    
    /// Data source
    var dataSource: [Group] = []

    /// Selected users
    var selectedUsers: [Group] = []

    /**
     View Did Load
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set navigation title
        self.navigationItem.title = "Select users"

        // Set delegate
        self.horizontalGroupAvatarCollectionView.delegate = self

        // Init table footer
        self.tableView.tableFooterView = UIView()

        // Init data source
        self.buildDataSource()
    }
    
    /**
     Build data source
     */
    private func buildDataSource() {
        
        self.dataSource = []
        
        let user1 = User()
        user1.name = "Kevin Wozniak"
        user1.imageUrl = "https://upload.wikimedia.org/wikipedia/commons/f/f6/Steve_Wozniak.jpg"
        self.dataSource.append(Group(users: [user1]))
        
        let user2 = User()
        user2.name = "Sophia Teutschler"
        user2.imageUrl = "https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAAfgAAAAJDVhZDdkZWEwLTllMGItNDJiNS1hYTBhLWI1MmNhMmJiZDYxMA.jpg"
        self.dataSource.append(Group(users: [user2]))

        let user3 = User()
        user3.name = "Oxlade Michael"
        user3.imageUrl = "https://amp.thisisinsider.com/images/59badf04e517bd2b248b47a5-750-750.jpg"
        self.dataSource.append(Group(users: [user3]))

        let user4 = User()
        user4.name = "Barbara Benevenuto"
        user4.imageUrl = "https://media-exp2.licdn.com/mpr/mpr/AAEAAQAAAAAAAAwHAAAAJDBmOTM2MDgwLWI0NzMtNGYzYS1hNDU3LTY1Y2VhMTk4OTNlMA.jpg"
        self.dataSource.append(Group(users: [user4]))

        let user5 = User()
        user5.name = "Rachel Baily"
        self.dataSource.append(Group(users: [user1, user3, user5]))

        let user6 = User()
        user6.name = "Steve Jobs"
        user6.imageUrl = "https://pi.tedcdn.com/r/pe.tedcdn.com/images/ted/0ef62e4df27b4ba7294de889fdbc33e476a08ec9_254x191.jpg"
        self.dataSource.append(Group(users: [user6]))

        let user7 = User()
        user7.name = "Ronald Austin"
        self.dataSource.append(Group(users: [user7]))

        let user8 = User()
        user8.name = "Alex Ortiz"
        self.dataSource.append(Group(users: [user8]))
    }

}

/// UITableView DataSource and Delegate
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    /**
     Number Of Sections
     */
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    /**
     Number Of Rows In Section
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    /**
     Cell For Row At indexPath
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Get Cell
        let cell = tableView.dequeueReusableCell(withIdentifier: SelectionTableViewCell.getReuseIdentifier()) as! SelectionTableViewCell
        let cellDtata = self.dataSource[indexPath.row]
        let iconImage = self.selectedUsers.contains(where: { $0.getGroupName() == cellDtata.getGroupName() }) ? UIImage(named: "selected") : UIImage(named: "not-selected")
        cell.setup(name: cellDtata.getGroupName(), avatars: cellDtata.getGroupUsers(), iconImage: iconImage)
     
        return cell
    }
    
    /**
     Height for row at indexPath
     */
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SelectionTableViewCell.getCellHeight()
    }
    
    /**
     Did select row at indexPath
     */
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        // Get User
        let user = self.dataSource[indexPath.row]

        // Update selected users
        if let userIndex = self.selectedUsers.firstIndex(where: {$0.getGroupName() == user.getGroupName()}) {
            self.selectedUsers.remove(at: userIndex)
        } else {
            self.selectedUsers.append(user)
        }

        // reload data
        self.tableView.reloadData()
        self.horizontalGroupAvatarCollectionView.reloadData()
    }
}

/// JNHorizontal Group Avatar Collection View Delegate
extension ViewController: JNHorizontalGroupAvatarCollectionViewDelegate {
    
    /**
     Number of items
     - Returns: The number of items in collection view
     */
    func horizontalGroupAvatarCollectionViewNumberOfItems() -> Int {
        return self.selectedUsers.count
    }
    
    /**
     Data for item at index
     - Parameter index: The item index
     - Returns: The data for the item
     */
    func horizontalGroupAvatarCollectionView(dataForItemAt index: Int) -> [JNGroupAvatar] {
        
        return self.selectedUsers[index].getGroupUsers()
    }
    
    /**
     Did clear data
     */
    func horizontalGroupAvatarCollectionViewDidClearData() {
        self.selectedUsers = []
        self.tableView.reloadData()
        self.horizontalGroupAvatarCollectionView.reloadData()
    }
}
