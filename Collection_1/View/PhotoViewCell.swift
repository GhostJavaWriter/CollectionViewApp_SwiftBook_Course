//
//  PhotoViewCell.swift
//  Collection_1
//
//  Created by Bair Nadtsalov on 30.10.2022.
//

import UIKit

class PhotoViewCell: UICollectionViewCell {
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView(frame: contentView.frame)
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        contentView.addSubview(view)
        return view
    }()
    
    func configureCell(with model: PetsModel) {
        let image = UIImage(named: model.photo)
        imageView.image = image
        
    }
}
