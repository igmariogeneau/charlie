//
//  ViewController.swift
//  Menu
//
//  Created by eleves on 17-07-20.
//  Copyright © 2017 eleves. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var textview: UITextView!
    var sections: [String] = []
    var rows: [Int] = []
    var aDict: [String: [Any]] = [:]
    
    let nachos = Nachos(withCheese: true, image: "nachos.jpg", price: 4.99, name: "Nachos")

    override func viewDidLoad() {
        super.viewDidLoad()
        sections = ["ENTREES", "MAINS", "DESSERTS"]
        rows = [6, 4, 5]
  
        aDict = ["ENTREES": [nachos], "MAINS": [nachos], "DESSERTS": [nachos]]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return aDict.count
    }
    //---------------------
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.backgroundColor = UIColor.clear
        let k = Array(aDict.keys)
        let v = aDict[k[section]] as? [Nachos]
        return (v?.count)!
    }
    //---------------------
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableview.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.textColor = UIColor.black
        cell?.backgroundColor = UIColor.clear
        return cell!
    }
    //---------------------
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell:UITableViewCell = tableView.cellForRow(at: indexPath as IndexPath)!
        selectedCell.contentView.backgroundColor = UIColor.darkGray
    }
    //---------------------
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableViewRowAnimation.automatic)
        }
    }
    //---------------------
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let s = Array(aDict.keys)
        if section < s.count {
            
            return s[section]

        }
        return nil
    }
    //---------------------
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let title = UILabel()
        title.font = UIFont(name: "Fahra", size: 20)
        title.textColor = UIColor.white
        let header = view as! UITableViewHeaderFooterView
        header.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
        header.textLabel?.font = title.font
        header.textLabel?.textColor = title.textColor
    }
    //---------------------
}










