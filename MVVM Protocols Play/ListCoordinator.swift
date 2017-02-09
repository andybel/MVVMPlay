//
//  ListCoordinator.swift
//  MVVM Protocols Play
//
//  Created by Andy Bell on 08/02/2017.
//  Copyright © 2017 snapp. All rights reserved.
//

import UIKit

protocol ListCoordinatorDelegate: class
{
    func listCoordinatorDidFinish(listCoordinator: ListCoordinator)
}

class ListCoordinator: Coordinator {
    
    var mainNavigationControl:UINavigationController?
    var listViewController: ListViewController?
    
    func startFromViewController(_ viewController: UIViewController?) {
        
        mainNavigationControl = viewController as? UINavigationController
        
        let storyboard = UIStoryboard(name: "List", bundle: nil)
        listViewController = storyboard.instantiateInitialViewController() as? ListViewController
        
        if let listVC = listViewController, let mainNC = mainNavigationControl {
            
            let viewModel = ListViewModel()
            viewModel.model = ["Italy","Germany","France","Holland","Spain"]
            viewModel.coordinatorDelegate = self
            listVC.viewModel = viewModel
            mainNC.viewControllers = [listVC]
        
        }
    
    }
    
}

extension ListCoordinator: ListViewModelCoordinatorDelegate {
    
    func listViewModelDidSelectData(_ viewModel: ListViewModel, data: DataItem) {
        
        print("We selected: \(data)")
        
    }
    
}
