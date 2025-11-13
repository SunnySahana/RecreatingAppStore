//
//  FeaturedViewController.swift
//  RecreatingAppStore
//
//  Created by Sahana Pachimatla on 11/10/25.
//

import UIKit

class FeaturedViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let cellId = "myCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blue
        
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.backgroundColor = UIColor.lightGray
        
        
        // Do any additional setup after loading the view.
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSizeMake(view.frame.width, 230)
    }
    
    
}
