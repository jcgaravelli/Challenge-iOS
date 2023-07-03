//
//  HomeView.swift
//  StoneChallenge
//
//  Created by Júlio Garavelli on 24/06/23.
//


import Foundation
import UIKit

class HomeView: UIView {

    var viewModel: HomeViewModel?
    var isPageRefreshing: Bool = false

    private lazy var stackView: UIStackView = {
        return UIStackView.setupStackView(arrangedSubviews: [ stackButtons, searchBar],
                                        axis: .vertical,
                                        alignment: .fill,
                                        distribution: .fill,
                                        spacing: 16)
    }()
    
    private lazy var stackButtons: UIStackView = {
       return UIStackView.setupStackView(arrangedSubviews: [statusButtonAlive, statusButtonDead, statusButtonUnknown],
                                            axis: .horizontal,
                                            alignment: .fill,
                                            distribution: .fillEqually,
                                            spacing: 8)
    }()
    
    private lazy var statusButtonAlive: SelectionButton = {
        let button = SelectionButton(frame: .zero)
        button.setupConfig(tag: FilterType.alive.rawValue,
                           identifier: "homeview_StatusButtonAlive",
                           text: "Alive",
                           actionButton: didTapButton)
        return button
    }()
    
    private lazy var statusButtonDead: SelectionButton = {
        let button = SelectionButton(frame: .zero)
        button.setupConfig(tag: FilterType.dead.rawValue,
                           identifier: "homeview_statusButtonAlive",
                           text: "Dead",
                           actionButton: didTapButton)
        return button
    }()

    private lazy var statusButtonUnknown: SelectionButton = {
        let button = SelectionButton(frame: .zero)
        button.setupConfig(tag: FilterType.unknown.rawValue,
                           identifier: "homeview_StatusButtonUnknown",
                           text: "Unknown",
                           actionButton: didTapButton)
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
        searchBar.sizeToFit()
        return searchBar
    }()
    
    private lazy var collectionView: UICollectionView = {
        var flowLayout = UICollectionViewFlowLayout()
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        
        flowLayout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 24, right: 16)
        flowLayout.itemSize = CGSize(width: 100, height: 150)
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumInteritemSpacing = 16
        flowLayout.minimumLineSpacing = 32
        flowLayout.collectionView?.isPagingEnabled = true
    
        collectionView.register(CharacterViewCell.self,
                                forCellWithReuseIdentifier: CharacterViewCell.identifier)
       return collectionView
    }()
    
    // MARK: - View init

    convenience init(viewModel: HomeViewModel?) {
        self.init(frame: .null)
        self.viewModel = viewModel
        self.viewModel?.reloadCollectionView = reloadCollectionView
        self.viewModel?.pageRefreshing = pageRefreshing
        self.viewModel?.hideKeyboard = hideKeyboard
        setupUI()
    }

    // MARK: - Private Functions
    
    private func setupUI() {
        backgroundColor = .white
        setupView()
    }
    
    private func setupView() {
        //stackView component
        addSubviews([stackView,collectionView])
        stackView
            .topToSuperview(16)
            .horizontalToSuperview(16)
        
        collectionView
            .bottomToSuperview()
            .leadingToSuperview()
            .trailingToSuperview()
            .topToBottom(of: stackView)
            
        setupCollectionConstraints()
    }
    
    // MARK: - CollectionView

    private func reloadCollectionView() {
        collectionView.reloadData()
        isPageRefreshing = false
    }
    
    private func setupCollectionConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        setupDelegate()
    }

    private func setupDelegate() {
        collectionView.delegate = viewModel
        collectionView.dataSource = viewModel
        
        searchBar.delegate = viewModel
    }

    @objc func didTapButton(sender: UIButton) {
        diselectButtons()
        var tag = 0
        if sender.tag != viewModel?.filter?.rawValue {
            sender.isSelected = true
            tag = sender.tag
        }
        viewModel?.didTapButton(tag)
    }

    func diselectButtons() {
        statusButtonAlive.isSelected = false
        statusButtonDead.isSelected = false
        statusButtonUnknown.isSelected = false
    }
}

extension HomeView {

    func pageRefreshing() {
        if (self.collectionView.contentOffset.y >= (self.collectionView.contentSize.height - self.collectionView.bounds.size.height)) {
                if !isPageRefreshing {
                    isPageRefreshing = true
                    viewModel?.parseGetCharacters(nextPage: true)
                }
            }
    }
}

// MARK: - Search Delegate
extension HomeView {

    func hideKeyboard() {
        self.searchBar.endEditing(true)
    }
}
