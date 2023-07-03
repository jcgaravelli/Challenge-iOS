//
//  HomeCoordinatpr.swift
//  StoneChallenge
//
//  Created by Júlio Garavelli on 27/06/23.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}

protocol HomeCoordinatorDelegate: AnyObject {
    func goToDetail(with characterDetail: CharacterModel)
}

class HomeCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewModel = HomeViewModel()
        viewModel.coordinatorDelegate = self
        let viewController = HomeViewController(viewModel: viewModel)
        
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension HomeCoordinator: HomeCoordinatorDelegate {

    func goToDetail(with characterDetail: CharacterModel) {
        let coordinator = CharacterDetailCoordinator(navigationController: navigationController,
                                                     characterDetail: characterDetail)
        coordinator.start()
        childCoordinators.append(coordinator)
    }
}
