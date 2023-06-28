//
//  CharacterDetailView.swift
//  StoneChallenge
//
//  Created by Júlio Garavelli on 27/06/23.
//

import UIKit

class CharacterDetailView: UIView {
    
    private lazy var stackView: UIStackView = {
        return StackView.setupStackView(arrangedSubviews: [characterImage, titleLabel],
                                        axis: .vertical,
                                        alignment: .fill,
                                        distribution: .fill,
                                        spacing: 16)
    }()
    
    lazy var characterImage: UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.image = UIImage(named: "star")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "characterDetailView_TitleLabel"
        label.backgroundColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.text = "Rick and Morty"
        label.textAlignment = .center
        return label
    }()
    
    private func setupUI() {
        setupView()
    }
    
    private func setupView() {
        //stackView component
        addSubviews([stackView])
        stackView
            .topToSuperview(16)
            .horizontalToSuperview(16)
        characterImage
            .topToSuperview()
            .leadingToSuperview()
            .trailingToSuperview()
    }
}


