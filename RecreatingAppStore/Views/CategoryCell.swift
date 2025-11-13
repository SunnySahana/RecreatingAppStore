//
//  CategoryCell.swift
//  RecreatingAppStore
//
//  Created by Sahana Pachimatla on 11/10/25.
//


import UIKit

class CategoryCell : UICollectionViewCell, UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    private let cellId = "My Cell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Best Movie apps", size: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var appsCollectionView : UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    var dividerLineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.5)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSizeMake(100, frame.height - 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
    }
    
    
    func setupViews(){
        backgroundColor = UIColor.clear
        addSubview(appsCollectionView)
        addSubview(dividerLineView)
        addSubview(titleLabel)
        
        appsCollectionView.delegate = self
        appsCollectionView.dataSource = self
        
        appsCollectionView.register(Appcell.self, forCellWithReuseIdentifier: cellId)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[V0]|", metrics: nil, views: ["V0": titleLabel]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[V0]|", metrics: nil, views: ["V0" : dividerLineView]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[V0]-8-|", metrics: nil, views: ["V0":appsCollectionView]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[namelabel(30)][V0][v1(0.5)]|", metrics: nil, views: ["V0":appsCollectionView, "v1" : dividerLineView, "namelabel" : titleLabel]))
    }
}

class Appcell : UICollectionViewCell{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    let imageView : UIImageView = {
        
        let iv = UIImageView()
        iv.image = UIImage(named: "movie")
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 15
        iv.layer.masksToBounds = true
        
        return iv
    }()
    
    let nameLabel : UILabel = {
        
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .black
        label.text = "Sahnaa pachimatla Frozen star"
        label.numberOfLines = 2
        return label
    }()
    
    let categoryLabel : UILabel = {
        
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.textColor = .darkGray
        label.text = "Movies"
        label.numberOfLines = 2
        return label
    }()
    
    let priceLabel : UILabel = {
        
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.textColor = .darkGray
        label.text = "$40.00"
        label.numberOfLines = 2
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(categoryLabel)
        addSubview(priceLabel)
        
        imageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.width)
        nameLabel.frame = CGRect(x: 0, y: frame.width + 2, width: frame.width, height: 35)
        categoryLabel.frame = CGRect(x: 0, y: frame.width + 35, width: frame.width, height: 30)
        
        priceLabel.frame = CGRect(x: 0, y: frame.width + 56, width: frame.width, height: 30)
    }
}
