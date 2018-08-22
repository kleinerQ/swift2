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
        let mystackView = UIStackView()
        let mybtn1 = UIButton()
        let mybtn2 = UIButton()
        mystackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mystackView)
        mystackView.axis = .horizontal
        mystackView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mystackView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        mystackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        mybtn1.backgroundColor = .red
        mybtn2.backgroundColor = .green
        mybtn1.setTitle("Btn1", for: .normal)
        mybtn2.setTitle("Btn2", for: .normal)
        mybtn1.addTarget(self, action: #selector(btn1Action), for: .touchUpInside)
        mybtn2.addTarget(self, action: #selector(btn2Action), for: .touchUpInside)
        mystackView.distribution = .fillEqually
        
        mystackView.addArrangedSubview(mybtn1)
        mystackView.addArrangedSubview(mybtn2)
        
//
  
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(myTableView)
        myTableView.topAnchor.constraint(equalTo: mystackView.bottomAnchor, constant: 0).isActive = true
        myTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        myTableView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        //myTableView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        
        //print(myTableView)
        // Do any additional setup after loading the view, typically from a nib.
    }

    @objc func btn1Action(){
        
        print("btn1")
    }
    @objc func btn2Action(){
        
        print("btn2")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

