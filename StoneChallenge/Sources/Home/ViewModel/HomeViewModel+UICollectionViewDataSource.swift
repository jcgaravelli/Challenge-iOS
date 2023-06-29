//
//  HomeViewModel+UICollectionViewDataSource.swift
//  StoneChallenge
//
//  Created by Júlio Garavelli on 26/06/23.
//

import UIKit
import Kingfisher

extension HomeViewModel: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredCharacter.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharacterViewCell", for: indexPath) as? CharacterViewCell else {
            return UICollectionViewCell()
        }
        
        myCell.setup(name: filteredCharacter[indexPath.row].name ?? "")
        
        let galleryImages = filteredCharacter[indexPath.row]
                
        if let imageUrl = galleryImages.image {
            let url = URL(string: imageUrl)
            myCell.characterImage.kf.setImage(with: url)
        }
        
        return myCell
    }
}
