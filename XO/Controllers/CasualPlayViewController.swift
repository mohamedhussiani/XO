//
//  CasualPlayViewController.swift
//  XO
//
//  Created by Mohamed Hussiani on 01/02/2024.
//

import UIKit

class CasualPlayViewController: UIViewController {
    
    // IMPORTANT: Sets the inital current turn of player 
    var currentTurn = Turn.cross
    
    let currentTurnLabel: UILabel = {
        let label = UILabel()
        // Cross goes first
        label.text = K.cross
        label.textColor = .black
        label.font = .systemFont(ofSize: 50, weight: .heavy)
        label.textColor = .black
        return label
    }()
    
    func detectChangeInCell() {
        
    }
    
    // An instance of MainBoardViewController for casual play feature
    let mainBoard = MainBoardViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCasualPlayUI()
      
    }
    
    func setupCasualPlayUI() {
        
        view.backgroundColor = .white
        
        addChild(mainBoard)
        view.addSubview(mainBoard.view)
        mainBoard.didMove(toParent: self)
        
        mainBoard.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainBoard.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainBoard.view.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            mainBoard.view.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1),
            mainBoard.view.heightAnchor.constraint(equalTo: mainBoard.view.widthAnchor, multiplier: 1/1)
        ])
        
        view.addSubview(currentTurnLabel)
        currentTurnLabel.translatesAutoresizingMaskIntoConstraints = false
        currentTurnLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 30).isActive = true
        currentTurnLabel.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor).isActive = true
        
    }

}
