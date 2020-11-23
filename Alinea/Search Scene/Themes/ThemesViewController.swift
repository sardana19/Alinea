//
//  ThemesViewController.swift
//  Alinea
//
//  Created by Kapil Sardana on 21/11/20.
//  Copyright © 2020 Kapil Sardana. All rights reserved.
//

import UIKit

class ThemesViewController: UIViewController {
    
    var collectionview: UICollectionView!
    var cellId = "Cell"
    var titleArray = ["Diversity & Inclusion", "Bold Biotech", "Crypto Central", "She runs it", "Clean & Green", "Cannabis-ness", "Power it", "Foodie Fun", "Art & Fashion", "Home is where the heart is"]
    var imageArray = ["one","two","three", "four","five", "six","seven", "eight","nine","ten"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if collectionview == nil {
            setUpCollectionView()
        }
    }
    
    func setUpCollectionView() {
        
        var frame = self.view.frame
        frame.origin.x = frame.origin.x + 5
        frame.origin.y = frame.origin.y + 5
        frame.size.width = frame.size.width - 10
        frame.size.height = frame.size.height - 10
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width:frame.size.width/2, height: 200)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        

        collectionview = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionview.dataSource = self
        collectionview.delegate = self
        collectionview.register(ThemesCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionview.showsVerticalScrollIndicator = false
        collectionview.backgroundColor = .white
        self.view.addSubview(collectionview)
        
        collectionview.translatesAutoresizingMaskIntoConstraints = false

        
        NSLayoutConstraint.activate([

        collectionview.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
        collectionview.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
        collectionview.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor,constant: 5),
        collectionview.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor,constant: 0),
        ])

        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ThemesViewController : UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ThemesCollectionViewCell
//        cell.backgroundColor = .magenta
        cell.lbl?.text = titleArray[indexPath.row]
        cell.imgView?.image = UIImage(named: imageArray[indexPath.row])
        return cell
    }
    
    
}
