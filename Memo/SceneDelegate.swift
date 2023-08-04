//
//  SceneDelegate.swift
//  Memo
//
//  Created by 박유경 on 2023/08/04.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _windowscene = (scene as? UIWindowScene) else { return }
        let coordinator = SceneCoordinator(window: window!)
        let listViewModel = DefaultViewModel(title: "나의메모", sceneCoordinator: coordinator)
        let listScene = Scene.defaultVM(listViewModel)
        coordinator.transition(to: listScene, using: .root, animated: false)
        guard let _ = (scene as? UIWindowScene) else { return }
    }
}

