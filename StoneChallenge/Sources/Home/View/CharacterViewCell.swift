//
//  CharacterViewCell.swift
//  StoneChallenge
//
//  Created by Júlio Garavelli on 26/06/23.
//

import UIKit

class CharacterViewCell: UICollectionViewCell {
    
    private lazy var characterNameLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "homeview_TitleLabel"
        label.backgroundColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Rick"
        label.textAlignment = .center
        return label
    }()
    
    private lazy var characterImage: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 5
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubviews([characterImage, characterNameLabel])
        
        characterImage
            .verticalToSuperview()
            .horizontalToSuperview()
    }
}
