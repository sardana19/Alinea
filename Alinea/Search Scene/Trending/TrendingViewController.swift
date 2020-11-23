//
//  TrendingViewController.swift
//  Alinea
//
//  Created by Kapil Sardana on 21/11/20.
//  Copyright © 2020 Kapil Sardana. All rights reserved.
//

import UIKit

struct Stock {
    var name : String
    var subTitle : String
    var image : String
    var price : Double
}

class TrendingViewController: UIViewController {
    
    var tableView : UITableView?
    
    var data = ["Top Gainers" :[Stock(name: "Medifast", subTitle: "MEDI", image: "medical", price: +50.78),
                                Stock(name: "Pinterest", subTitle: "PINS", image: "pinterest", price: -4.77),
                                Stock(name: "Slack Technologies", subTitle: "WORK", image: "slack", price: -5.99),
                                Stock(name: "Evoqua Water", subTitle: "AQUA", image: "drop", price: +5.99)],
                "Top Sellers":[Stock(name: "Slack Technologies", subTitle: "WORK", image: "slack", price: -5.99),
                               Stock(name: "Evoqua Water", subTitle: "AQUA", image: "drop", price: +5.99)]]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .magenta
        setUpTableView()
        // Do any additional setup after loading the view.
    }
    
    func setUpTableView(){
        tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView?.dataSource = self
        tableView?.delegate = self
        tableView?.register(TrendingTableViewCell.self, forCellReuseIdentifier: "trendingCell")
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


extension TrendingViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var name = "Top Gainers"
        if section == 1 {
            name = "Top Sellers"
        }
        if let obj = data[name] {
            return obj.count
        }
        return 0
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "trendingCell", for: indexPath) as? TrendingTableViewCell {
            var name = "Top Gainers"
            if indexPath.section == 1 {
                name = "Top Sellers"
            }
            if let obj = data[name] {
                let stockObj : Stock = obj[indexPath.row]
                cell.lblName?.text = stockObj.name
                cell.lblDesc?.text = stockObj.subTitle
                cell.imgView?.image = UIImage(named: stockObj.image)
                
                if stockObj.price < 0 {
                    cell.lblprice?.text = String(format: "%0.2f %@", stockObj.price,"%")
                    cell.lblprice?.backgroundColor = UIColor(red: 113.0/255.0, green: 215.0/255.0, blue: 182.0/255.0, alpha: 1.0)
                }else{
                    cell.lblprice?.text = String(format: "+%0.2f %@", stockObj.price,"%")
                    cell.lblprice?.backgroundColor = UIColor(red: 236.0/255.0, green: 115.0/255.0, blue: 112.0/255.0, alpha: 1.0)
                }
            }
            
            
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 40))
        let lbl = UILabel(frame: CGRect(x: 20, y: 8, width: tableView.frame.size.width-40, height: 25))
        lbl.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.bold)
        lbl.text = "Top Gainers"
        if section == 1 {
            lbl.text = "Top Sellers"
        }
        view.addSubview(lbl)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
