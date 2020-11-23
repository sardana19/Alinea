//
//  CustomView.swift
//  Alinea
//
//  Created by Kapil Sardana on 22/11/20.
//  Copyright © 2020 Kapil Sardana. All rights reserved.
//

import Foundation
import UIKit


protocol CustomviewTapDelegate {
    func viewTapped(_ view : CustomView)
}

class CustomView : UIView {
    
    var label : UILabel!
    var footerView : UIView!
    var customDelegate : CustomviewTapDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        label = UILabel(frame: CGRect(x: 0, y: 5, width: Int(frame.width), height: Int(frame.height) - 2))
        label.textAlignment = .center
        addSubview(label)
        label.text = ""
        footerView = UIView(frame: CGRect(x: 15, y: frame.size.height-2, width: frame.width-30, height: 2))
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
        addSubview(footerView)
        footerView.backgroundColor = .clear
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        self.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        self.customDelegate?.viewTapped(self)
        selectView()
    }
    
    func selectView(){
        label.textColor = .systemPurple
        label.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.medium)
        footerView.backgroundColor = .systemPurple
    }
    
    func unSelectView(){
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
        footerView.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
