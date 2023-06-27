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
       print("User tapped on item \(indexPath.row)")
    }
}
