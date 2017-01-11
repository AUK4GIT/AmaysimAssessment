//
//  ASSubscriptionsInfoViewController.swift
//  Amaysim
//
//  Created by Uday Kiran Ailapaka on 11/01/17.
//  Copyright © 2017 Uday Kiran Ailapaka. All rights reserved.
//

import UIKit

class ASSubscriptionsInfoViewController: UIViewController {
    
    @IBOutlet weak var tableVew: UITableView!

    let helper = ASHelper.sharedInstance;
    var attributes : [[String : AnyObject]] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableVew.separatorStyle = UITableViewCellSeparatorStyle.none
        self.tableVew.register(UINib.init(nibName: "ProfileCell", bundle: nil), forCellReuseIdentifier: "ProfileCell")
        self.tableVew.rowHeight = 54;
        if let attributes = helper.profile?["attributes"] as? [String : AnyObject]{
            self.attributes.append(["contact-number":attributes["contact-number"]!]) ;
            self.attributes.append(["email-address":attributes["email-address"]!]) ;
            self.attributes.append(["date-of-birth":attributes["date-of-birth"]!]) ;
            self.attributes.append(["payment-type":attributes["payment-type"]!]) ;
            
        }
    }
    
    @IBAction func closeView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //    MARK: UITableView Delegates and DataSources
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.attributes.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell")! as UITableViewCell
        let dict : [String:AnyObject] = self.attributes[indexPath.row]
        cell.textLabel?.text  = dict.keys.first
        cell.detailTextLabel?.text  = dict.values.first as? String
        return cell;
    }
}
