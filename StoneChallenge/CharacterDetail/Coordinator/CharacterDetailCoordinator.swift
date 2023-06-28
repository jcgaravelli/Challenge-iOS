//
//  CharacterDetailCoordinator.swift
//  StoneChallenge
//
//  Created by Júlio Garavelli on 27/06/23.
//

import UIKit

class CharacterDetailCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = CharacterDetailViewController()
        self.navigationController.pushViewController(vc, animated: true)
    }
}
