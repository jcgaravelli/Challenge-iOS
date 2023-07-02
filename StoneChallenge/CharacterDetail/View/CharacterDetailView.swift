//
//  CharacterDetailView.swift
//  StoneChallenge
//
//  Created by Júlio Garavelli on 27/06/23.
//

import UIKit
import Kingfisher

class CharacterDetailView: UIView {
    
    var viewModel: CharacterDetailViewModel?
    
    private lazy var stackView: UIStackView = {
        return StackView.setupStackView(arrangedSubviews: [characterImage, characterNameLabel, characterStatus, characterSpecies, characterType, characterGender],
                                        axis: .vertical,
                                        alignment: .fill,
                                        distribution: .fill,
                                        spacing: 0)
    }()
    
    lazy var characterImage: UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        image.image = UIImage(named: "Person")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var characterNameLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "characterDetailView_CharacterNameLabel"
        label.backgroundColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var characterStatus: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "characterDetailView_CharacterStatus"
        label.backgroundColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var characterSpecies: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "characterDetailView_CharacterSpecies"
        label.backgroundColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var characterType: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "characterDetailView_CharacterType"
        label.backgroundColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var characterGender: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "characterDetailView_CharacterGender"
        label.backgroundColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .left
        return label
    }()
    
    convenience init(viewModel: CharacterDetailViewModel) {
        self.init(frame: .null)
        self.viewModel = viewModel
        setupUI()
    }
    
    private func setupUI() {
        setupView()
        setupCharacterDetail()
    }
    
    private func setupView() {
        //stackView component
        addSubviews([stackView])
        stackView
            .topToSuperview(16)
            .horizontalToSuperview()
    }
    
    private func setupCharacterDetail() {
        if let imageUrl = viewModel?.characterDetailModel.image {
            let url = URL(string: imageUrl)
            characterImage.kf.setImage(with: url)
        }
        
        characterNameLabel.text = viewModel?.characterDetailModel.name
        characterStatus.text = viewModel?.characterDetailModel.status
        characterSpecies.text = viewModel?.characterDetailModel.species
        characterType.text = viewModel?.characterDetailModel.type
        characterGender.text = viewModel?.characterDetailModel.gender
    }
}
