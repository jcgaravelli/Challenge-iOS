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
    let characterModel: CharacterModel

    init(navigationController: UINavigationController,
         characterDetail: CharacterModel) {
        self.navigationController = navigationController
        self.characterModel = characterDetail
    }

    func start() {
        let vm = CharacterDetailViewModel(characterDetailModel: characterModel)
        let vc = CharacterDetailViewController(viewModel: vm)
        self.navigationController.pushViewController(vc, animated: true)
    }
}
