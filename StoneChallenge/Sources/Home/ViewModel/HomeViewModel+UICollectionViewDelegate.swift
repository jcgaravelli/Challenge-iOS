//
//  HomeViewModel+UICollectionViewDelegate.swift
//  StoneChallenge
//
//  Created by Júlio Garavelli on 26/06/23.
//

import UIKit

extension HomeViewModel: UICollectionViewDelegate {
 
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        coordinatorDelegate?.goToDetail(with: filteredCharacter[indexPath.row])
    }
}
