//
//  CharacterDetailViewController.swift
//  StoneChallenge
//
//  Created by Júlio Garavelli on 27/06/23.
//

import UIKit

class CharacterDetailViewController: UIViewController {
    
    var contentView: CharacterDetailView
    var viewModel: CharacterDetailViewModel?

    init(viewModel: CharacterDetailViewModel) {
        let contentView = CharacterDetailView(viewModel: viewModel)
        self.viewModel = viewModel
        self.contentView = contentView
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        setupView()
    }
    
    func setupView() {
        self.view.addSubviewInsideSafeArea(contentView)
    }

}
