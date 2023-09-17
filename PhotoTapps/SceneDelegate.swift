//
//  SceneDelegate.swift
//  PhotoTapps
//
//  Created by Matvei Khlestov on 14.09.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.makeKeyAndVisible()
        let flowLayout = UICollectionViewFlowLayout()
        window.rootViewController = UINavigationController(
            rootViewController: PhotosViewController(collectionViewLayout: flowLayout)
        )
        self.window = window
    }
}

