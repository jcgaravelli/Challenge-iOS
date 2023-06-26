//
//  HomeViewController.swift
//  StoneChallenge
//
//  Created by Júlio Garavelli on 25/06/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    internal let homeView: HomeView = HomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubviewInsideSafeArea(HomeView())
    }
}
