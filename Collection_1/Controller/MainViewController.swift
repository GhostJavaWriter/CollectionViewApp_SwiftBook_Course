//
//  MainViewController.swift
//  Collection_1
//
//  Created by Bair Nadtsalov on 30.10.2022.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - Layout constants
    
    private let edgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    private let itemPerRow: CGFloat = 2
    
    // MARK: - Properties
    
    private let reuseIdentifier = String(describing: PhotoViewCell.self)
    private var pets: [PetsModel] = [
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

// MARK: - UICollectionViewDelegate

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath)

        UIView.animate(withDuration: 0.5,
                           animations: {
                            //Fade-out
                            cell?.alpha = 0.5
            }) { (completed) in
                UIView.animate(withDuration: 0.5,
                               animations: {
                                //Fade-out
                                cell?.alpha = 1
                })
            }
        
        let detailViewController = DetailViewController()
        let navController = UINavigationController(rootViewController: detailViewController)
        
        detailViewController.configureImageView(with: pets[indexPath.item])
        present(navController, animated: true)
    }
}

// MARK: - UICollectionViewDataSource

extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotoViewCell else { return UICollectionViewCell()}
        
        cell.configureCell(with: pets[indexPath.item])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingWidth = self.edgeInsets.left * (itemPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingWidth
        let itemWidth = availableWidth / itemPerRow
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return self.edgeInsets.left
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return self.edgeInsets.left
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset = self.edgeInsets.left
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
}


