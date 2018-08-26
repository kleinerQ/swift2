//
//  CViewController.swift
//  testDemo_CYwithout
//
//  Created by Cyen on 2018/8/21.
//  Copyright © 2018年 Cyen. All rights reserved.
//

import UIKit

class CViewController: UIViewController {

    
    
    func addNavBarWithRightItem(titleString: String)-> UINavigationBar{
        
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        let NameHeight = screenHeight * 0.09
        let NameWidth = screenWidth
        let navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: NameWidth, height: NameHeight))
        let navItem = UINavigationItem(title: titleString)
        
        let doneItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.stop, target: nil, action: #selector(done))
        navItem.rightBarButtonItem = doneItem
        navBar.setItems([navItem], animated: false)
        return navBar
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(addNavBarWithRightItem(titleString: "CViewController"))
        //self.navigationController = UINavigationController()
        //print(navigationController)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @objc func done(){
        
        self.dismiss(animated: true, completion: nil)
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
