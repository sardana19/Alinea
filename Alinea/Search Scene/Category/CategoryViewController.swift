//
//  CategoryViewController.swift
//  Alinea
//
//  Created by Kapil Sardana on 21/11/20.
//  Copyright © 2020 Kapil Sardana. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
    
    var tableView : UITableView?
    
    var titleArray = ["Stocks", "ETFs", "Crypto"]
    
    var imageArray = ["stocks", "etfs", "crypto"]
    
    var colorArray = [UIColor(red: 164.0/255.0, green: 166.0/255.0, blue: 247.0/255.0, alpha: 1.0),
    UIColor(red: 75.0/255.0, green: 83.0/255.0, blue: 200.0/255.0, alpha: 1.0),UIColor(red: 249.0/255.0, green: 215.0/255.0, blue: 93.0/255.0, alpha: 1.0)]

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        // Do any additional setup after loading the view.
    }
    
    func setUpTableView(){
        tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView?.dataSource = self
        tableView?.delegate = self
        tableView?.register(CategoryTableViewCell.self, forCellReuseIdentifier: "categoryCell")
        tableView?.separatorStyle = .none
        self.view.addSubview(tableView!)
        tableView?.backgroundColor = UIColor(hex: "f5f5f5")
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

extension CategoryViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as? CategoryTableViewCell {
            cell.lbl?.text = titleArray[indexPath.row]
            cell.imgView?.image = UIImage(named: imageArray[indexPath.row])
            cell.outerView?.backgroundColor = colorArray[indexPath.row]
            if indexPath.row == 2 {
                cell.lineView?.isHidden = true
            }else{
                cell.lineView?.isHidden = false
            }
            cell.backgroundColor = .clear
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
}
