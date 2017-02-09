//
//  MasterCoordinator.swift
//  MVVM Protocols Play
//
//  Created by Andy Bell on 08/02/2017.
//  Copyright © 2017 snapp. All rights reserved.
//

import UIKit

protocol Coordinator {
    func startFromViewController(_ viewController:UIViewController?)
}

class MasterCoordinator {
    
    var window:UIWindow
    var coordinators = [String:Coordinator]()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        
        let mainNC = UINavigationController()
        self.window.rootViewController = mainNC
        
        let listCoordinator = ListCoordinator()
        coordinators["LIST-COORD"] = listCoordinator
        listCoordinator.startFromViewController(mainNC)
        
    }
    
}
