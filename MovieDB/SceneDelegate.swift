//
//  SceneDelegate.swift
//  MovieDB
//
//  Created by Павел Пономарев on 24/09/2019.
//  Copyright © 2019 pavponn. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    @available(iOS 13.0, *)
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let scene = (scene as? UIWindowScene) else { return }
        
        let tabController = UITabBarController()
        let navigationControllers = [
            UINavigationController(rootViewController: SearchViewController()),
            UINavigationController(rootViewController: SettingsViewController())
        ]
        
        
        // MARK: SETUP Navigation Controllers
        setUpNavigationController(navigationController: navigationControllers[0], title: "Search", preferLargeTitles: true)
        setUpNavigationController(navigationController: navigationControllers[1], title: "Settings", preferLargeTitles: true)
        
        
        // MARK: SETUP Tab bar
        setUpTabBarController(tabBarController: tabController, viewControllers: navigationControllers)
       
         // MARK: SETUP window
        window = UIWindow()
        window?.makeKeyAndVisible()
        window?.rootViewController = tabController
        window?.backgroundColor = ViewConstants.APP_MAIN_COLOR
        window?.windowScene = scene
    }
    
    func setUpNavigationController(navigationController: UINavigationController, title: String, preferLargeTitles: Bool) {
        
        navigationController.title = title
        
        let regularAttributes = [
            NSAttributedString.Key.foregroundColor: ViewConstants.MAIN_FONT_COLOR,
            NSAttributedString.Key.font: ViewConstants.MAIN_REGULAR_FONT
        ]
        
        let largeAttributes = [
            NSAttributedString.Key.foregroundColor: ViewConstants.MAIN_FONT_COLOR,
            NSAttributedString.Key.font: ViewConstants.MAIN_LARGE_FONT
        ]

        navigationController.navigationBar.largeTitleTextAttributes = largeAttributes as [NSAttributedString.Key : Any]
        navigationController.navigationBar.titleTextAttributes = regularAttributes as [NSAttributedString.Key : Any]
        
        navigationController.navigationBar.prefersLargeTitles = preferLargeTitles
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.barStyle = .default
        navigationController.navigationBar.barTintColor = ViewConstants.APP_MAIN_COLOR
        navigationController.navigationBar.backgroundColor = ViewConstants.APP_MAIN_COLOR
    }
    
    func setUpTabBarController(tabBarController: UITabBarController, viewControllers: [UIViewController]?) {
        tabBarController.viewControllers = viewControllers
        tabBarController.tabBar.barStyle = .black
        tabBarController.tabBar.tintColor = ViewConstants.MAIN_FONT_COLOR
        tabBarController.tabBar.barTintColor = ViewConstants.APP_MAIN_COLOR
        tabBarController.tabBar.backgroundColor = ViewConstants.APP_MAIN_COLOR
        tabBarController.tabBar.isTranslucent = false
        
    }
    
    @available(iOS 13.0, *)
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    @available(iOS 13.0, *)
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    @available(iOS 13.0, *)
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    @available(iOS 13.0, *)
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    @available(iOS 13.0, *)
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }

}
