//
//  CharacterViewCell.swift
//  StoneChallenge
//
//  Created by Júlio Garavelli on 26/06/23.
//

import UIKit
import Kingfisher

class CharacterViewCell: UICollectionViewCell {
    
    static let identifier = "CharacterViewCell"
    
    private var name: String = ""
    private var image: String = ""
    
    private lazy var characterNameLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "homeview_TitleLabel"
        label.backgroundColor = .clear
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()
    
    lazy var characterImage: UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.layer.cornerRadius = 5
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        characterImage.frame = contentView.bounds
    }
    
    private func setupUI() {
        contentView.addSubviews([characterNameLabel, characterImage])
        
        characterImage
            .verticalToSuperview()
            .horizontalToSuperview()
        characterNameLabel
            .topToBottom(of: characterImage)
            .horizontalToSuperview()
    }

    func setup(name: String) {
        self.characterNameLabel.text = name
    }
}
