//
//  SceneDelegate.swift
//  Hotdog
//
//  Created by Oleksiy on 10.09.2020.
//  Copyright © 2020 Oleksiy. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        if let scene = scene as? UIWindowScene {
            
          scene.sizeRestrictions?.minimumSize = CGSize(width: 600, height: 800)
          scene.sizeRestrictions?.maximumSize = CGSize(width: 600, height: 800)
        }

        let contentView = ContentView()
        
        if let windowScene = scene as? UIWindowScene {
            
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            window.makeKeyAndVisible()
            
            self.window = window
        }
    }
}
