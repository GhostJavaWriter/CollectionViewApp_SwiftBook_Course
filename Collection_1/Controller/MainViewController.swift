//
//  MainViewController.swift
//  Collection_1
//
//  Created by Bair Nadtsalov on 30.10.2022.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - Properties
    
    let reuseIdentifier = String(describing: PhotoViewCell.self)
    var pets: [PetsModel] = [
        PetsModel(name: "Dog1", photo: "dog1"),
        PetsModel(name: "Dog2", photo: "dog2"),
        PetsModel(name: "Dog3", photo: "dog3"),
        PetsModel(name: "Dog4", photo: "dog4"),
        PetsModel(name: "Dog5", photo: "dog5"),
        PetsModel(name: "Dog6", photo: "dog6"),
        PetsModel(name: "Dog7", photo: "dog7"),
    ]
    
    private lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        let frame = view.frame
        let view = UICollectionView(frame: frame, collectionViewLayout: layout)
        view.register(PhotoViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        return view
    }()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Pets photoshoots"
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}


