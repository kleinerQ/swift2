//
//  ViewController.swift
//  tableViewTest
//
//  Created by Yen on 2018/8/22.
//  Copyright © 2018年 Yen. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    let titleList = ["a","b","c"]

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "ggg"
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerText = UILabel()
        headerText.backgroundColor = .blue
        headerText.text = titleList[section]
        headerText.textAlignment = .center
        return headerText
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let myTableView = UITableView()
  
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(myTableView)
        myTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        myTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        myTableView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        //myTableView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        
        //print(myTableView)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

