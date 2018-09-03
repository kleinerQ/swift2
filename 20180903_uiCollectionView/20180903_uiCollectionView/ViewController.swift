//
//  ViewController.swift
//  20180903_uiCollectionView
//
//  Created by Yen on 2018/9/3.
//  Copyright © 2018年 Yen. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    let images = ["t1","t2","t3","t4","t5","t6","t7","t8","t9","t10","t11","t12"]
    var collectionView: UICollectionView!
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = UIColor.orange
        let myImageView = UIImageView()
        myImageView.frame.size = cell.frame.size
        myImageView.image = UIImage(named: images[indexPath.row])
        myImageView.clipsToBounds = true
        myImageView.contentMode = .scaleAspectFit
        
        //print(myImageView.image)
        //print(myImageView)
        cell.contentView.addSubview(myImageView)
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 90, height: 120)
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.backgroundColor = UIColor.white
        self.view.addSubview(collectionView)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

