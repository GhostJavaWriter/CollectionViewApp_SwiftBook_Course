//
//  MainViewController_UICollectionViewDelegate.swift
//  Collection_1
//
//  Created by Bair Nadtsalov on 1.11.2022.
//

import UIKit

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
        
        let paddingWidth = Constants.edgeInsets.left * (Constants.itemPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingWidth
        let itemWidth = availableWidth / Constants.itemPerRow
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.edgeInsets.left
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.edgeInsets.left
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset = Constants.edgeInsets.left
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
}
