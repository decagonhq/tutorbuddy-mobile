//
//  SceneDelegate.swift
//  TutorBuddy
//
//  Created by Folahanmi Kolawole on 16/07/2022.
//

import UIKit
import Swinject

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    let defaults = UserDefaults.standard
    
    static let dependencyContainer: Container = {
        let container = Container()
        DependencyContainer.configure(using: container)
        return container
    }()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = UINavigationController(rootViewController: AppDelegate.dependencyContainer.onboardingController).apply { $0.isNavigationBarHidden = true }
        window?.makeKeyAndVisible()
      
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {}

    func sceneDidBecomeActive(_ scene: UIScene) {}

    func sceneWillResignActive(_ scene: UIScene) {}

    func sceneWillEnterForeground(_ scene: UIScene) {}

    func sceneDidEnterBackground(_ scene: UIScene) {}


}

