//
//  DetailViewController.swift
//  Collection_1
//
//  Created by Bair Nadtsalov on 30.10.2022.
//

import UIKit

class DetailViewController: UIViewController {

    private lazy var imageView: UIImageView = {
        let view = UIImageView(frame: self.view.frame)
        view.contentMode = .scaleAspectFit
        self.view.addSubview(view)
        return view
    }()
    
    private lazy var shareButton: UIButton = {
        
        let button = UIButton()
        let image = UIImage(systemName: "square.and.arrow.up")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .systemBackground
        button.setTitle(" Tap to share", for: .normal)
        button.addTarget(self, action: #selector(shareTapped), for: .touchUpInside)
        self.view.addSubview(button)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        configureButton()
    }
    
    func configureImageView(with model: PetsModel) {
        imageView.image = UIImage(named: model.photo)
    }
    
    private func configureButton() {
        shareButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        shareButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    @objc func shareTapped(sender: UIButton) {
        
        if let image = imageView.image {
            let shareController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
            shareController.completionWithItemsHandler = {_, bool, _, _ in
                if bool {
                    print("Success!")
                }
            }
            present(shareController, animated: true)
        }
        
    }
}
