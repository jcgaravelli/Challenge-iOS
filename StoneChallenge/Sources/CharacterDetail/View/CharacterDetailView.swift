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
        return UIStackView.setupStackView(arrangedSubviews: [characterNameLabel, characterStatus, characterSpecies, characterType, characterGender],
                                        axis: .vertical,
                                        alignment: .fill,
                                          distribution: .fillProportionally,
                                        spacing: 8)
    }()
    
    lazy var stackCardView: UIStackView = {
        return UIStackView.setupStackView(arrangedSubviews: [characterImage, stackView],
                                          axis: UIScreen.main.isLandscape ? .horizontal : .vertical,
                                          alignment: .fill,
                                          distribution: .fill,
                                        spacing: 12)
    }()

    lazy var cardView: UIView = {
       let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var characterImage: UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var characterNameLabel: DescriptionLabel = {
        let label = DescriptionLabel(fontSize: 24,
                                     identifier: "characterDetailView_CharacterNameLabel")
        return label
    }()
    
    private lazy var characterStatus: DescriptionLabel = {
        let label = DescriptionLabel(fontSize: 18,
                                     identifier: "characterDetailView_CharacterStatus")
        return label
    }()
    
    private lazy var characterSpecies: DescriptionLabel = {
        let label = DescriptionLabel(fontSize: 18,
                                     identifier: "characterDetailView_CharacterSpecies")
        return label
    }()
    
    private lazy var characterType: DescriptionLabel = {
        let label = DescriptionLabel(fontSize: 18,
                                     identifier: "characterDetailView_CharacterType")
        return label
    }()
    
    private lazy var characterGender: DescriptionLabel = {
        let label = DescriptionLabel(fontSize: 18,
                                     identifier: "characterDetailView_CharacterGender")
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
        addSubviews([cardView])

        cardView
            .topToSuperview()
            .horizontalToSuperview(16)

        cardView.addSubviews([stackCardView])

        stackCardView
            .verticalToSuperview(16)
            .horizontalToSuperview(16)
        
        characterImage.heightAnchor.constraint(equalToConstant: 300).isActive = true
    }
    
    private func setupCharacterDetail() {
        guard let viewModel else { return }
        let imageUrl = viewModel.characterDetailModel.image
        let url = URL(string: imageUrl)
        characterImage.kf.setImage(with: url)
        
        characterNameLabel
            .setText(label: "Name",
                     value: viewModel.characterDetailModel.name)
        
        characterStatus
            .setText(label: "Status",
                     value: viewModel.characterDetailModel.status)
        
        characterSpecies
            .setText(label: "Species",
                     value: viewModel.characterDetailModel.species)

        characterType
            .setText(label: "Type",
                     value: viewModel.characterDetailModel.type)
    
        characterGender
            .setText(label: "Gender",
                     value: viewModel.characterDetailModel.gender)
    }

    func reloadStack() {
        stackCardView.axis = UIScreen.main.isLandscape ? .horizontal : .vertical
    }
}
