//
//  MiniBoardViewController.swift
//  XO
//
//  Created by Mohamed Hussiani on 28/01/2024.
//

import UIKit

class MainBoardViewController: UIViewController {
    
    // MainBoardView
    private let mainBoard = MainBoardView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MiniBoard Setup
    private func setupView() {
        
        view.backgroundColor = .white
        
        view.addSubview(mainBoard)
        
        // Set up contraints for MiniBoard
        mainBoard.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainBoard.centerYAnchor.constraint(equalTo: view.layoutMarginsGuide.centerYAnchor),
            mainBoard.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            mainBoard.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 1),
            mainBoard.heightAnchor.constraint(equalTo: mainBoard.widthAnchor, multiplier: 1/1),
        ])
    }
}



