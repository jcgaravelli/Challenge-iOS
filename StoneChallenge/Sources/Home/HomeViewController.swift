//
//  HomeViewController.swift
//  StoneChallenge
//
//  Created by Júlio Garavelli on 25/06/23.
//

import UIKit

class HomeViewController: UIViewController {

    var contentView: HomeView
    var viewModel: HomeViewModel?

    init(viewModel: HomeViewModel? = nil) {
        let contentView = HomeView(viewModel: viewModel)
        self.viewModel = viewModel
        self.contentView = contentView
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Rick and Morty"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupView()
    }
    
    func setupView() {
        self.view.addSubviewInsideSafeArea(contentView)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel?.viewWillAppear()
    }
}
