//
//  ViewController.swift
//  CollectionViewAssignment
//
//  Created by Ankur Baranwal on 17/10/2019.
//  Copyright © 2019 Ankur Baranwal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var cellWidth: CGFloat = 0
    
    var players: [Player] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "DetailsCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "DetailsCollectionViewCell")
        
        let headerNib = UINib(nibName: "HeaderCollectionViewCell", bundle: nil)
        collectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCollectionViewCell")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let numberOfItemsPerRow = 2
        let inset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 10
        
        cellWidth = (UIScreen.main.bounds.width - (inset.left + inset.right + CGFloat((numberOfItemsPerRow - 1) * 10)))/CGFloat(numberOfItemsPerRow)
        
        getPlayerDetail()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func getPlayerDetail(){
        let player1 = Player(name: "Mahendra Sign Dhoni", profile: UIImage(named: "dhoni")!)
        let player2 = Player(name: "Sikhar Dhawan", profile: UIImage(named: "dhawan")!)
        let player3 = Player(name: "Jadega", profile: UIImage(named: "jadega")!)
        let player4 = Player(name: "Harbhajan Singh", profile: UIImage(named: "harbhajan")!)
        let player5 = Player(name: "Sachin Tendulkar", profile: UIImage(named: "sachin")!)
        let player6 = Player(name: "Rohit Sharma", profile: UIImage(named: "rohit")!)
        let player7 = Player(name: "Yuvraj Singh", profile: UIImage(named: "yuvi")!)
        let player8 = Player(name: "Zaheer Khan", profile: UIImage(named: "zaheer")!)
        let player9 = Player(name: "Virat Kohli", profile: UIImage(named: "kohli")!)
        let player10 = Player(name: "Shri Sant", profile: UIImage(named: "sant")!)
        let player11 = Player(name: "Hardik Pandya", profile: UIImage(named: "hardik")!)
        
        players.append(player1)
        players.append(player2)
        players.append(player3)
        players.append(player4)
        players.append(player5)
        players.append(player6)
        players.append(player7)
        players.append(player8)
        players.append(player9)
        players.append(player10)
        players.append(player11)
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return players.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailsCollectionViewCell", for: indexPath) as? DetailsCollectionViewCell else{
            fatalError("Cell is not loaded")
        }
        cell.profileImage.image = players[indexPath.row].profile
        cell.nameLabel.text = players[indexPath.row].name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderCollectionViewCell", for: indexPath) as? HeaderCollectionViewCell else{
                fatalError("Header Cell is not loaded")
            }
            return sectionHeader
        } else {
            return UICollectionReusableView()
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 60)
    }
    
    
}
extension ViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellWidth - 0.2 , height: cellWidth )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return inset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}

