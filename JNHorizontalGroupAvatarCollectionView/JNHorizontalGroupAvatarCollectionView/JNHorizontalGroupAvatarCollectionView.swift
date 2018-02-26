//
//  JNHorizontalGroupAvatarCollectionView.swift
//  JNHorizontalGroupAvatarCollectionView
//
//  Created by JNDisrupter on 2/22/18.
//

import UIKit
import JNGroupAvatarImageView

/// JNHorizontal Group Avatar Collection View
open class JNHorizontalGroupAvatarCollectionView: UIView, UICollectionViewDataSource {
    
    /// Collection view
    @IBOutlet private weak var collectionView: UICollectionView!
    
    /// Harri custom selection view Delegate
    public var delegate: JNHorizontalGroupAvatarCollectionViewDelegate?
    
    /// Cell padding
    public var cellPadding: CGFloat = 20
    
    /// Images Layout Direction
    public var imagesLayoutDirection: ImagesLayoutDirection = ImagesLayoutDirection.rightToLeft
    
    /// Avatars Margin
    public var avatarsMargin: CGFloat = 0.0
    
    /// Avatars Separator Color
    public var separatorColor: UIColor = UIColor.gray
    
    /// Avatars Place Holder Image
    public var placeHolderImage: UIImage! = nil
    
    /// Show Initails
    public var showInitails: Bool = true
    
    /// Initials Font
    public var initialsFont: UIFont = UIFont.systemFont(ofSize: 14)
    
    /// Initial Text Color
    public var initialTextColor: UIColor = UIColor.black
    
    /**
     Initializer
     */
    convenience public init() {
        self.init(frame: CGRect.zero)
    }
    
    /**
     Initializer
     */
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        // Initialize view
        self.initView()
    }
    
    /**
     Initializer
     */
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Initialize view
        self.initView()
    }
    
    /**
     Awake from Nib
     */
    override open func awakeFromNib() {
        super.awakeFromNib()
        
        // Set collection data source and delegate
        self.collectionView.dataSource = self
        self.collectionView.showsHorizontalScrollIndicator = false
        
        // Register cell
        let bundle = Bundle(for: AvatarCollectionViewCell.self)
        let nib = UINib(nibName: "AvatarCollectionViewCell", bundle: bundle)
        self.collectionView.register(nib, forCellWithReuseIdentifier: AvatarCollectionViewCell.getReuseIdentifier())
        
        // Set collection ayout
        let layout = AvatarsCollectionViewFlowLayout()
        layout.cellPadding = self.cellPadding
        self.collectionView.collectionViewLayout = layout
    }
    
    /**
     Did click clear
     */
    @IBAction private func didClickClear(_ sender: UIButton) {
        
        // Call delegate
        self.delegate?.horizontalGroupAvatarCollectionViewDidClearData()
    }
    
    /**
     Reload data
     */
    public func reloadData() {
        self.collectionView.reloadData()
    }
    
    /**
     Initialize the sub views
     */
    private func initView() {
        
        let bundle = Bundle(for: JNHorizontalGroupAvatarCollectionView.self)
        let nib = UINib(nibName: "JNHorizontalGroupAvatarCollectionView", bundle: bundle)
        
        // Instantiate view from nib
        if let view = nib.instantiate(withOwner: self, options: nil).first as? UIView {
            view.translatesAutoresizingMaskIntoConstraints = false
            
            self.addSubview(view)
            
            // Add View constraints
            view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            view.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
            view.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        }
    }
    
    // MARK: - UICollectionViewDataSource
    
    /**
     Number of sections
     */
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    /**
     Number of items in section
     */
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.delegate?.horizontalGroupAvatarCollectionViewNumberOfItems() ?? 0
    }
    
    /**
     Cell for item at index
     */
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Get cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AvatarCollectionViewCell.getReuseIdentifier(), for: indexPath) as! AvatarCollectionViewCell
        
        if let cellData = self.delegate?.horizontalGroupAvatarCollectionView(dataForItemAt: indexPath.row) {
        
            // Setup cell
            cell.setup(avatars: cellData, imagesLayoutDirection: self.imagesLayoutDirection, avatarsMargin: self.avatarsMargin, separatorColor: self.separatorColor, placeHolderImage: self.placeHolderImage, showInitails: self.showInitails, initialsFont: self.initialsFont, initialTextColor: self.initialTextColor)
        }
        
        return cell
    }
}

/// JN horizontal group avatar collection view Delegate
public protocol JNHorizontalGroupAvatarCollectionViewDelegate {
    
    /**
     Number of items
     - Returns: The number of items in collection view
     */
    func horizontalGroupAvatarCollectionViewNumberOfItems() -> Int
    
    /**
     Data for item at index
     - Parameter index: The item index
     - Returns: The data for the item
     */
    func horizontalGroupAvatarCollectionView(dataForItemAt index: Int) -> [JNGroupAvatar]
    
    /**
     Did clear data
     */
    func horizontalGroupAvatarCollectionViewDidClearData()
}
