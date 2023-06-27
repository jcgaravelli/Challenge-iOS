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
    var flowLayout = UICollectionViewFlowLayout()
    
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
        configSelectionButton(button: button,
                              tag: FilterType.alive.rawValue,
                              identifier: "homeview_StatusButtonAlive",
                              text: "Alive")
        return button
    }()
    
    private lazy var statusButtonDead: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        configSelectionButton(button: button,
                              tag: FilterType.dead.rawValue,
                              identifier: "homeview_statusButtonAlive",
                              text: "Dead")
        return button
    }()

    private lazy var statusButtonUnknown: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        configSelectionButton(button: button,
                              tag: FilterType.unknown.rawValue,
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
        //searchBar.showsCancelButton = true
        //searchBar.showsBookmarkButton = false
        searchBar.sizeToFit()
        return searchBar
    }()
    
    private lazy var collectionView: UICollectionView = {
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
       return collectionView
    }()
    
    // MARK: - View init

    convenience init(viewModel: HomeViewModel) {
        self.init(frame: .null)
        self.viewModel = viewModel
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

    func configSelectionButton(button: UIButton,
                               tag: Int,
                               identifier: String,
                               text: String) {
        button.accessibilityIdentifier = identifier
        button.backgroundColor = .blue
        button.clipsToBounds = true
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 16
        button.sizeToFit()
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(text, for: .normal)
        button.addTarget(self,
                         action: #selector(didTapButton),
                       for: .touchUpInside)
        button.tag = tag
    }
    
    // MARK: - CollectionView
    
    private func setupCollectionConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        setupStyle()
    }

    func setupStyle() {
        collectionView.delegate = viewModel
        collectionView.dataSource = viewModel
        collectionView.backgroundColor = .clear
        
        setupCollectionViewLayout()
    }

    private func setupCollectionViewLayout() {
        flowLayout = UICollectionViewFlowLayout()
        flowLayout.estimatedItemSize = CGSize(width: 100, height: 100)
        flowLayout.scrollDirection = .vertical
        flowLayout.sectionInset = UIEdgeInsets(top: 16,
                                               left: 16,
                                               bottom: 16,
                                               right: 16)
        collectionView.collectionViewLayout = flowLayout
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = true
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }

    @objc func didTapButton(sender: UIButton) {
        viewModel?.didTapButton(sender)
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
