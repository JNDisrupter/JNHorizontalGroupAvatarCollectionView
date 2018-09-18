//
//  AvatarsCollectionViewFlowLayout.swift
//  JNHorizontalGroupAvatarCollectionView
//
//  Created by JNDisrupter on 2/22/18.
//

import UIKit

/// Avatars collection view flow layout
class AvatarsCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    /// Cell padding
    var cellPadding: CGFloat = 0.0
    
    /**
     Prepare
     */
    override func prepare() {
        super.prepare()
        
        // Get collection view frame
        let collectionViewFrame = self.collectionView!.frame
        let cellDimension = min(collectionViewFrame.width, collectionViewFrame.height)

        // Make sure the last item is clipped to indicate the horizontal scrolling
        let maximumNumberOfItems = (collectionViewFrame.width / (cellDimension + self.cellPadding))
        let remainingSpace = maximumNumberOfItems.truncatingRemainder(dividingBy: 1.0) * (cellDimension + self.cellPadding)
        var sectionLeftRightPadding: CGFloat = 0.0
        
        // we need to check if remaining space is more than cell dimention which means that there is already a clipped item
        // And calculate section padding by showing 0.3 percent of the cell diemention
        if remainingSpace >= cellDimension {
            sectionLeftRightPadding = remainingSpace - cellDimension + (0.3 * cellDimension)
        }

        // Set layout attributes
        self.scrollDirection = UICollectionView.ScrollDirection.horizontal
        self.itemSize = CGSize(width: cellDimension, height: cellDimension)
        self.minimumLineSpacing = self.cellPadding
        self.sectionInset = UIEdgeInsets.init(top: 0, left: sectionLeftRightPadding, bottom: 0, right: sectionLeftRightPadding)
    }
}
