//
//  MainCoordinator.swift
//  ToDoList
//
//  Created by maksim.surkov on 19.06.2022.
//

import Foundation
import UIKit

class MainCoordinator: CoordinatorProtocol {
    var childCoordinators = [CoordinatorProtocol]()
    
    var navigationController: UINavigationController
    
    init(navController: UINavigationController) {
        self.navigationController = navController
    }
    
    func start() {
        let vc = CreatedTaskViewController()
        navigationController.pushViewController(vc, animated: false)
    }
}
