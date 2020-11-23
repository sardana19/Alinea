//
//  CategoryTableViewCell.swift
//  Alinea
//
//  Created by Kapil Sardana on 21/11/20.
//  Copyright © 2020 Kapil Sardana. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    var outerView : UIView?
    var imgView : UIImageView?
    var lbl : UILabel?
    var lineView : UIView?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let width = UIScreen.main.bounds.size.width
        outerView = UIView(frame: CGRect(x: 10, y: 10, width: width-20, height: 90))
        outerView?.layer.masksToBounds = true
        outerView?.layer.cornerRadius = 45
        outerView?.backgroundColor = .green
        lineView = UIView(frame: CGRect(x: 0, y: 109, width: width, height: 1))
        lineView?.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        
        imgView = UIImageView(frame: CGRect(x: 20, y: 15, width: 60, height: 60))
        imgView?.layer.masksToBounds = true
        imgView?.layer.cornerRadius = 30
        imgView?.contentMode = .scaleAspectFit
        outerView?.addSubview(imgView!)
        
        lbl = UILabel(frame: CGRect(x: 100, y: 30, width: 100, height: 30))
        lbl?.textColor = .white
        lbl?.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.bold)
        outerView?.addSubview(lbl!)
        
        contentView.addSubview(lineView!)
        contentView.addSubview(outerView!)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
