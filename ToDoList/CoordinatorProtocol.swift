//
//  CorrdinatorProtocol.swift
//  ToDoList
//
//  Created by maksim.surkov on 19.06.2022.
//

import Foundation
import UIKit

protocol CoordinatorProtocol {
    var childCoordinators: [CoordinatorProtocol] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
