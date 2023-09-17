//
//  CustomPhotoViewCell.swift
//  PhotoTapps
//
//  Created by Matvei Khlestov on 15.09.2023.
//

import UIKit

final class CustomPhotoViewCell: UICollectionViewCell {
    let dogImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(dogImageView)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Constraints
extension CustomPhotoViewCell {
    private func setConstraints() {
        dogImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [
                dogImageView.topAnchor.constraint(
                    equalTo: contentView.topAnchor,
                    constant: 0
                ),
                dogImageView.bottomAnchor.constraint(
                    equalTo: contentView.bottomAnchor,
                    constant: 0
                ),
                dogImageView.leadingAnchor.constraint(
                    equalTo: contentView.leadingAnchor,
                    constant: 0
                ),
                dogImageView.trailingAnchor.constraint(
                    equalTo: contentView.trailingAnchor,
                    constant: 0
                )
            ]
        )
    }
}
