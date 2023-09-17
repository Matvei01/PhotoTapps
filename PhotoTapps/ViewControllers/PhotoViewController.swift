//
//  PhotoViewController.swift
//  PhotoTapps
//
//  Created by Matvei Khlestov on 17.09.2023.
//

import UIKit

final class PhotoViewController: UIViewController {
    
    // MARK: - Public Properties
    var photo: Photo?
    
    // MARK: -  UI Elements
    private lazy var dogImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = photo?.name
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    private lazy var shareButton: UIButton = {
        var attributes = AttributeContainer()
        attributes.font = .systemFont(ofSize: 18)
        attributes.foregroundColor = .systemBackground
        
        var buttonConfiguration = UIButton.Configuration.plain()
        buttonConfiguration.attributedTitle = AttributedString(" Tap to Share", attributes: attributes)
        buttonConfiguration.image = UIImage(systemName: "square.and.arrow.up")
        
        let button = UIButton(
            configuration: buttonConfiguration,
            primaryAction: UIAction { [unowned self] _ in
                shareButtonTapped()
            })
        
        return button
    }()
    
    // MARK: - Life cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
}

// MARK: - Private Methods
extension PhotoViewController {
    private func configure() {
        view.backgroundColor = UIColor(named: "photoVCBackgroundcolor")
        view.addSubview(dogImageView)
        view.addSubview(shareButton)
        
        setConstraints()
    }
    
    private func shareButtonTapped() {
        let shareVC = UIActivityViewController(
            activityItems: [photo?.name ?? UIImage()],
            applicationActivities: nil
        )
        shareVC.completionWithItemsHandler = { _, bool, _, _ in
            if bool {
                print("Успешно!")
            }
        }
        
        present(shareVC, animated: true)
    }
}

// MARK: - Constraints
extension PhotoViewController {
    private func setConstraints() {
        dogImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [
                dogImageView.centerYAnchor.constraint(
                    equalTo: view.centerYAnchor
                ),
                dogImageView.heightAnchor.constraint(
                    equalToConstant: 300
                ),
                dogImageView.leadingAnchor.constraint(
                    equalTo: view.leadingAnchor,
                    constant: 0
                ),
                dogImageView.trailingAnchor.constraint(
                    equalTo: view.trailingAnchor,
                    constant: 0
                )
            ]
        )
        
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [
                shareButton.centerXAnchor.constraint(
                    equalTo: view.centerXAnchor
                ),
                shareButton.bottomAnchor.constraint(
                    equalTo: view.bottomAnchor,
                    constant: -36
                )
            ]
        )
    }
}
