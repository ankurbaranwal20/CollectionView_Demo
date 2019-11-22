//
//  SecondViewController.swift
//  CollectionViewAssignment
//
//  Created by Ankur Baranwal on 17/10/2019.
//  Copyright © 2019 Ankur Baranwal. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var array = ["Rohit","Ankur","Krishna","Harsh","Kuldeep","Komal","Jai Shankar","Veeru Shashtra buddhi","Ankit","Amit"]
    var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.size.width
        layout.estimatedItemSize = CGSize(width: width, height: 10)
        return layout
    }()
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        let nib = UINib(nibName: "SecondCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "SecondCollectionViewCell")
        collectionView.collectionViewLayout = layout
        // Do any additional setup after loading the view.
    }
    

}

extension SecondViewController: UICollectionViewDataSource,UICollectionViewDelegate{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SecondCollectionViewCell", for: indexPath) as? SecondCollectionViewCell else{
            fatalError("error")
        }
        cell.labelOutlet.text = array[indexPath.row]
        return cell
    }
    
    
}
