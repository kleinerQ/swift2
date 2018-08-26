//
//  myCellViewController.swift
//  tableViewTest
//
//  Created by Yen on 2018/8/24.
//  Copyright © 2018年 Yen. All rights reserved.
//

import UIKit

class myCellViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = . red
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "< Back", style: .plain, target: self, action: #selector(goBack))
//        let backBtn = UINavigationItem(title: "Back")
//
//        navigationController?.navigationBar.setItems([backBtn], animated: false)
        // Do any additional setup after loading the view.
    }

    @objc func goBack(){
        dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
