//
//  AppCoordinator.swift
//  GBank
//
//  Created by Guilherme de Assis dos Santos on 23/06/21.
//

import UIKit

class AppCoordinator {
    let window: UIWindow
    let coordinator = GSCoordinator()
    
    init(_ window: UIWindow) {
        self.window = window
    }
    
    
    func start() {
        window.rootViewController = coordinator.start()
        window.makeKeyAndVisible()
    }
}
