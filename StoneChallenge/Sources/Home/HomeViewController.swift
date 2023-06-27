//
//  HomeViewController.swift
//  StoneChallenge
//
//  Created by Júlio Garavelli on 25/06/23.
//

import UIKit

class HomeViewController: UIViewController {

    var viewModel: HomeViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel?.viewWillAppear()
    }

    func setupView() {
        let viewModel = HomeViewModel()
        let view = HomeView(viewModel: viewModel)
        self.viewModel = viewModel
        self.view.addSubviewInsideSafeArea(view)
    }
}
