//
//  CustomLayout.swift
//  Bitirme
//
//  Created by Başak Ertuğrul on 1.05.2021.
//

import UIKit

class CustomLayout: UICollectionViewFlowLayout {
    private let ScaleFactor:CGFloat = 0.001
    override func prepare() {
        scrollDirection = UICollectionView.ScrollDirection.horizontal
        minimumLineSpacing = 20.0
        sectionInset = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 40)
        super.prepare()
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let array = super.layoutAttributesForElements(in: rect)
        let centerX =  (collectionView?.contentOffset.x)! + (collectionView?.bounds.size.width)!/2
        for attr in array! {
            let cell_centerX = attr.center.x
            let distance = abs(cell_centerX-centerX)
            let scale:CGFloat = 1/(1+distance*ScaleFactor)
            attr.transform3D = CATransform3DMakeScale(1.0, scale, 1.0)
        }
        return array
    }
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        let visibleX = proposedContentOffset.x
        let visibleY = proposedContentOffset.y
        let visibleW = collectionView?.bounds.size.width
        let visibleH = collectionView?.bounds.size.height
        let targetRect = CGRect(x: visibleX, y: visibleY, width: visibleW!, height: visibleH!)
        let centerX = proposedContentOffset.x + (collectionView?.bounds.size.width)!/2
        let attrArr = super.layoutAttributesForElements(in: targetRect)!
        var min_attr = attrArr[0]
        for attributes in attrArr {
            if (abs(attributes.center.x-centerX) < abs(min_attr.center.x-centerX)) {
                min_attr = attributes
            }
        }
        let ofsetX = min_attr.center.x - centerX
        return CGPoint(x: proposedContentOffset.x+ofsetX, y: proposedContentOffset.y)
    }
    
}
