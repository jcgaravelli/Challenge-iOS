//
//  HomeView.swift
//  StoneChallenge
//
//  Created by Júlio Garavelli on 24/06/23.
//


import Foundation
import UIKit

class HomeView: UIView {
    
    private lazy var stackView: UIStackView = {
        return StackView.setupStackView(arrangedSubviews: [titleLabel, stackButtons, searchBar],
                                        axis: .vertical,
                                        alignment: .fill,
                                        distribution: .fill,
                                        spacing: 16)
    }()
    
    private lazy var stackButtons: UIStackView = {
       return StackView.setupStackView(arrangedSubviews: [statusButtonAlive, statusButtonDead, statusButtonUnknown],
                                            axis: .horizontal,
                                            alignment: .fill,
                                            distribution: .fillEqually,
                                            spacing: 8)
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "homeview_TitleLabel"
        label.backgroundColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.text = "Rick and Morty"
        label.textAlignment = .center
        return label
    }()
    
    private lazy var statusButtonAlive: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configSelectionButton(tag: 1,
                            identifier: "homeview_StatusButtonAlive",
                            text: "Alive")
        return button
    }()
    
    private lazy var statusButtonDead: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configSelectionButton(tag: 2,
                            identifier: "homeview_statusButtonAlive",
                            text: "Dead")
        return button
    }()
    
    private lazy var statusButtonUnknown: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configSelectionButton(tag: 3,
                            identifier: "homeview_StatusButtonUnknown",
                            text: "Unknown")
        return button
    }()
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.tintColor = UIColor.black.withAlphaComponent(1.0)
        searchBar.placeholder = "Search"
        searchBar.backgroundColor = UIColor.clear
        searchBar.barTintColor = UIColor.clear
        searchBar.searchBarStyle = .minimal
        searchBar.returnKeyType = .search
        searchBar.showsCancelButton = false
        searchBar.showsBookmarkButton = false
        searchBar.sizeToFit()
        return searchBar
    }()
    
    // MARK: - View init
    
    convenience init() {
        self.init(frame: .null)
        setupUI()
    }
    
    // MARK: - Private Functions
    
    private func setupUI() {
        backgroundColor = .white
        setupView()
    }
    
    private func setupView() {
        //stackView component
        addSubviewOffsideSafeArea(stackView)
        stackView
            .topToSuperview(16)
            .horizontalToSuperview()
        stackButtons
            .horizontalToSuperview(16)
        
        searchBar
            .topToBottom(of: stackButtons, margin: 8)
    }
}

// MARK: - Search Delegate
//extension HomeViewController: UISearchBarDelegate {
//
//    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
//        searchActive = true
//        self.searchBar.showsCancelButton = true
//        self.collectionView.reloadData()
//    }
//
//    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        self.searchBar.text = ""
//        self.filtered = []
//        searchActive = false
//        self.searchBar.showsCancelButton = false
//        self.searchBar.endEditing(true)
//        self.dismiss(animated: true, completion: nil)
//        self.collectionView.reloadData()
//    }
//
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//
//        if searchBar.text! == " "  {
//            filtered = exercises
//            collectionView.reloadData()
//        } else {
//
//        filtered = exercises.filter({ (item) -> Bool in
//
//            return (item.exerciseNameLabel?.localizedCaseInsensitiveContains(String(searchBar.text!)))!
//
//            })
//
//        collectionView.reloadData()
//        }
//
//    }
//
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        collectionView.reloadData()
//    }
//
//}
