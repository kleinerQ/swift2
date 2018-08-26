//
//  AViewController.swift
//  testDemo_CYwithout
//
//  Created by Cyen on 2018/8/22.
//  Copyright © 2018年 Cyen. All rights reserved.
//

import UIKit

class AViewController: UIViewController {

    var myContainerViewContraint = NSLayoutConstraint()

    
    
    
    var moveFlag = false
    static func addNavBar(titleString: String)-> UINavigationBar{
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height

        let NameHeight = screenHeight * 0.09
        let NameWidth = screenWidth
        let navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: NameWidth, height: NameHeight))
        let navItem = UINavigationItem(title: titleString)
        
        navBar.setItems([navItem], animated: false)
        return navBar
    }
    
    
    func addVerticleStackView() -> UIStackView{
//        let screenSize = UIScreen.main.bounds
//        let screenWidth = screenSize.width
//        let screenHeight = screenSize.height
        let stackView = UIStackView(frame: CGRect(x: 10, y: 10, width: 200, height: 100))
//        stackView.addArrangedSubview(item1InStackView())
//        stackView.addArrangedSubview(item2InStackView())
        stackView.axis = .vertical
        stackView.spacing = 1
        
        stackView.insertArrangedSubview(item1InStackView(), at: 0)
        stackView.insertArrangedSubview(item2InStackView(), at: 1)
        stackView.distribution = .fillProportionally
        
        //stackView.backgroundColor = .purple
        //stackView.setintrinsicContentSize = CGSize(width: 1.0, height: 1.0)
        return stackView
    }
    func item1InStackView()->UIView{

        let myLabel = UILabel()
        myLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 1)
        myLabel.text = "infoNameLabel"
        myLabel.textAlignment = .center
        myLabel.backgroundColor = .green
        return myLabel
    }
    func item2InStackView()->UIView{
        
        let myTextField = UITextField()
        myTextField.frame = CGRect(x: 0, y: 0, width: 100, height: 5)
        myTextField.placeholder = "infoTextView"
        myTextField.textAlignment = .center
        myTextField.backgroundColor = .green
        return myTextField
    }
    
    func addContainerView()->UIView{
        
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        let myContainerView = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight * 0.4))
        myContainerView.backgroundColor = .gray

        return myContainerView
    }
    
    func addBtn()->UIButton{
        

        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.gray
        button.setTitle("MOVE Btn", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        return button
    }
    
    func addImageView()->UIImageView{
        
        
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.gray
        button.setTitleColor(UIColor.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        return button
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let navbar = AViewController.addNavBar(titleString: "AViewController")
        self.view.addSubview(navbar)

        let myContainerView = addContainerView()
        
        
        self.view.addSubview(myContainerView)
        
        let myMoveButton = addBtn()
        myMoveButton.addTarget(self, action: #selector(moveButtonAction), for: .touchUpInside)
        let myStackView = addVerticleStackView()
        myContainerView.addSubview(myStackView)
        myContainerView.addSubview(myMoveButton)
        myContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        myContainerViewContraint = myContainerView.topAnchor.constraint(equalTo: navbar.bottomAnchor)
        myContainerViewContraint.isActive = true
        
        
        myContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor ).isActive = true
        myContainerView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        myContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        myStackView.translatesAutoresizingMaskIntoConstraints = false
        myStackView.topAnchor.constraint(equalTo: myContainerView.topAnchor,constant: 20).isActive = true
        myStackView.leadingAnchor.constraint(equalTo: myContainerView.leadingAnchor,constant: 20).isActive = true
        myStackView.bottomAnchor.constraint(equalTo: myContainerView.bottomAnchor,constant: -20).isActive = true
        myStackView.widthAnchor.constraint(equalTo: myContainerView.widthAnchor, multiplier: 0.6).isActive = true
        
        myMoveButton.bottomAnchor.constraint(equalTo: myContainerView.bottomAnchor,constant: -20).isActive = true
        myMoveButton.trailingAnchor.constraint(equalTo: myContainerView.trailingAnchor,constant: -20).isActive = true
        
                
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @objc func moveButtonAction(){
        if !moveFlag{
            print("true")
            self.myContainerViewContraint.constant = 100
            UIView.animate(withDuration: 0.5) {
                self.view.layoutIfNeeded()
            }

            //
            moveFlag = !moveFlag
        }else{
            print("false")

            
            self.myContainerViewContraint.constant = 0

            
            UIView.animate(withDuration: 0.5) {
                self.view.layoutIfNeeded()
            }
            //self.view.layoutIfNeeded()
            moveFlag = !moveFlag

        }
        
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


