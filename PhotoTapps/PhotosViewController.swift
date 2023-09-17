//
//  PhotosViewController.swift
//  PhotoTapps
//
//  Created by Matvei Khlestov on 14.09.2023.
//

import UIKit

final class PhotosViewController: UICollectionViewController {
    
    private let photos = Photo.getPhotos()
    
    private let photoCell = "photo"
    
    private let itemsPerRow: CGFloat = 2
    
    private let sectionInserts = UIEdgeInsets(
        top: 20, left: 20, bottom: 20, right: 20
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        collectionView.register(CustomPhotoViewCell.self, forCellWithReuseIdentifier: photoCell)
        
        title = "Photo Tapps"
    }
    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        photos.names.count
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: photoCell,
                                                      for: indexPath) as! CustomPhotoViewCell
        let imageName = photos.names[indexPath.item]
        
        cell.dogImageView.image = UIImage(named: imageName)
        
        return cell
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
