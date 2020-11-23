//
//  TrendingTableViewCell.swift
//  Alinea
//
//  Created by Kapil Sardana on 22/11/20.
//  Copyright © 2020 Kapil Sardana. All rights reserved.
//

import UIKit

class TrendingTableViewCell: UITableViewCell {
    
    var lblName : UILabel?
    var lblDesc : UILabel?
    var imgView : UIImageView?
    var lblprice : UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        imgView = UIImageView(frame: CGRect(x: 20, y: 18, width: 35, height: 35))
        imgView?.layer.masksToBounds = true
        imgView?.layer.cornerRadius = 17.5
        imgView?.contentMode = .scaleAspectFit
        contentView.addSubview(imgView!)
        
        lblName = UILabel(frame: CGRect(x: 65, y: 14, width: 200, height: 18))
        lblName?.textColor = .black
        lblName?.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.medium)
        contentView.addSubview(lblName!)
        
        lblDesc = UILabel(frame: CGRect(x: 65, y: 36, width: 100, height: 18))
        lblDesc?.textColor = .systemGray
        lblDesc?.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
        contentView.addSubview(lblDesc!)
        
        lblprice = UILabel(frame: CGRect(x: UIScreen.main.bounds.size.width - 100, y: 25, width: 80, height: 20))
        lblprice?.textColor = .systemGray
        lblprice?.layer.masksToBounds = true
        lblprice?.layer.cornerRadius = 10
        lblprice?.textColor = .white
        lblprice?.textAlignment = .center
        lblprice?.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.semibold)
        contentView.addSubview(lblprice!)
        
        let lineView = UIView(frame: CGRect(x: 0, y: 69.5, width: UIScreen.main.bounds.size.width, height: 0.5))
        lineView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        contentView.addSubview(lineView)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
