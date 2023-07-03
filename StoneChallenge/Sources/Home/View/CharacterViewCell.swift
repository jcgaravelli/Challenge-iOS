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
        label.backgroundColor = .init(red: 0,
                                      green: 0,
                                      blue: 0,
                                      alpha: 0.7)
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.textColor = .systemGreen
        return label
    }()
    
    lazy var characterImage: UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
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
        contentView.addSubviews([characterImage,
                                 characterNameLabel])

        characterImage
            .verticalToSuperview()
            .horizontalToSuperview()
        characterNameLabel
            .horizontalToSuperview()
            .bottomToSuperview()
        
        contentView.layer.cornerRadius = 5
        contentView.clipsToBounds = true
    }

    func setup(name: String) {
        self.characterNameLabel.text = name
    }
}
