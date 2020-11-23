//
//  ThemesCollectionViewCell.swift
//  Alinea
//
//  Created by Kapil Sardana on 22/11/20.
//  Copyright © 2020 Kapil Sardana. All rights reserved.
//

import UIKit

class ThemesCollectionViewCell: UICollectionViewCell {
    
    var outerView : UIView?
    var imgView : UIImageView?
    var lbl : UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    



    func addViews(){
        let width = self.frame.size.width
        outerView = UIView(frame: CGRect(x: 5, y: 5, width: width-10, height: 190))
        outerView?.layer.masksToBounds = true
        outerView?.layer.cornerRadius = 10
        outerView?.backgroundColor = UIColor(red: 240.0/255.0, green: 241.0/255.0, blue: 242.0/255.0, alpha: 1.0)
       
        
        imgView = UIImageView(frame: CGRect(x: width/2-40, y: 15, width: 80, height: 130))
        imgView?.layer.masksToBounds = true
        imgView?.layer.cornerRadius = 30
        imgView?.contentMode = .scaleAspectFit
        outerView?.addSubview(imgView!)
        
        lbl = UILabel(frame: CGRect(x: 25, y: 140, width: width-50, height: 45))
        lbl?.textColor = .white
        lbl?.numberOfLines = 0
        lbl?.textColor = .black
        lbl?.textAlignment = .center
        lbl?.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium)
        outerView?.addSubview(lbl!)
        contentView.addSubview(outerView!)
    }
    
}
