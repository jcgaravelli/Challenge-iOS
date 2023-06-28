//
//  CharacterDetailViewController.swift
//  StoneChallenge
//
//  Created by Júlio Garavelli on 27/06/23.
//

import UIKit

class CharacterDetailViewController: UIViewController {
    
//    required init?(coder aDecoder: NSCoder) {
//        self.contentView = contentView
//        super.init(coder: aDecoder)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        
        setupView()
    }
    
    func setupView() {
        view.addSubview(CharacterDetailView())
    }
}
