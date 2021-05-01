//
//  CustomViewCell.swift
//  Bitirme
//
//  Created by Başak Ertuğrul on 1.05.2021.
//

import UIKit

class CustomViewCell: UICollectionViewCell {
    var lable:UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        lable = UILabel(frame: CGRect(x: (SCREEN_WIDTH-80)/2-100/2, y:100 , width: 100, height: 100))
        lable?.backgroundColor = UIColor.purple
        lable?.textAlignment = NSTextAlignment.center
        self.addSubview(lable!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
