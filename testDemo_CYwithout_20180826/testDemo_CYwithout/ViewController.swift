//
//  ViewController.swift
//  testDemo_CYwithout
//
//  Created by Cyen on 2018/8/21.
//  Copyright © 2018年 Cyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UIScrollViewDelegate{

    static var colors:[UIColor] = [UIColor.red, UIColor.green, UIColor.blue]
    static var myframe = CGRect(x: 0, y: 0, width: 0, height: 0)
    var myScrollerView = UIScrollView()
    var myPageController = UIPageControl()
    var mySkipButton = UIButton()
    var setupButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.gray
        button.setTitle("Button", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        return button
    }()
    
    var setupPageController :UIPageControl =  {
        let pagecontroller = UIPageControl(frame: CGRect(x: 200, y: 600, width: 100, height: 40))
        
        pagecontroller.backgroundColor = UIColor.yellow
        pagecontroller.tintColor = .gray
        
        pagecontroller.numberOfPages = colors.count
        pagecontroller.currentPage = 0
        pagecontroller.currentPageIndicatorTintColor = colors[pagecontroller.currentPage]
        return pagecontroller
        
    }()
    
    var setupScrollerView :UIScrollView =  {
        
        
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        
        let qScrollerView = UIScrollView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        
        qScrollerView.backgroundColor = UIColor.green
        qScrollerView.isPagingEnabled = true
        qScrollerView.showsHorizontalScrollIndicator = false
        for index in 0 ..< colors.count{
            myframe.origin.x = qScrollerView.frame.size.width * CGFloat(index)
            myframe.size = qScrollerView.frame.size
            let view = UIView(frame: myframe)
            view.backgroundColor = colors[index]
            qScrollerView.addSubview(view)
            
        }
        
        qScrollerView.contentSize = CGSize(width: (qScrollerView.frame.size.width * CGFloat(colors.count)), height: qScrollerView.frame.size.height)
        
        return qScrollerView
        
    }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        myScrollerView = setupScrollerView
        myScrollerView.delegate = self
        view.addSubview(myScrollerView)
        
        mySkipButton = setupButton
        view.addSubview(mySkipButton)

        myPageController = setupPageController
        view.addSubview(myPageController)
        
        setBtnPostion()
        
        setupButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        // Do any additional setup after loading the view, typically from a nib.
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = myScrollerView.contentOffset.x / myScrollerView.frame.size.width
        print(pageNumber)
        myPageController.currentPage = Int(pageNumber)
        print(myPageController.currentPage)
        myPageController.currentPageIndicatorTintColor = ViewController.colors[myPageController.currentPage]
        
    }
    func setBtnPostion(){
        
        setupButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        setupButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        setupButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        setupButton.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }

    @objc func buttonAction(sender: UIButton!) {
        let vc = myTabBarViewController()
        
        //print(vc.gg)
        print("AAAAAA")
        self.present(vc, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}


