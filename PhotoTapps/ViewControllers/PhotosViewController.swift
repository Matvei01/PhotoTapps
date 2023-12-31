//
//  PhotosViewController.swift
//  PhotoTapps
//
//  Created by Matvei Khlestov on 14.09.2023.
//

import UIKit

final class PhotosViewController: UICollectionViewController {
    
    // MARK: - Private Properties
    private let photos = Photo.getPhotos()
    
    private let photoCell = "photo"
    
    private let itemsPerRow: CGFloat = 2
    
    private let sectionInserts = UIEdgeInsets(
        top: 20, left: 20, bottom: 20, right: 20
    )
    
    // MARK: - Life cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
}

// MARK: - Private Methods
extension PhotosViewController {
    private func configure() {
        collectionView.register(CustomPhotoViewCell.self, forCellWithReuseIdentifier: photoCell)
        
        title = "Photo Tapps"
    }
}

// MARK: - UICollectionViewDataSource
extension PhotosViewController {
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: photoCell,
                                                      for: indexPath) as! CustomPhotoViewCell
        let photo = photos[indexPath.item]
        
        cell.configure(photo)
        
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension PhotosViewController {
    override func collectionView(_ collectionView: UICollectionView,
                                 didSelectItemAt indexPath: IndexPath) {
        
        let photoVC = PhotoViewController()
        let photo = photos[indexPath.item]
        photoVC.photo = photo
        
        present(photoVC, animated: true)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingWidth = sectionInserts.left * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingWidth
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        
        sectionInserts
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        sectionInserts.left
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        sectionInserts.left
    }
}
