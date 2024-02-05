//
//  MainBoardView.swift
//  XO
//
//  Created by Mohamed Hussiani on 04/02/2024.
//

import UIKit

class MainBoardView: UIView, Identifiable {
    
    let id = UUID()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        // Create three horizontal stacks
        let rowOne = createHStack()
        let rowTwo = createHStack()
        let rowThree = createHStack()
        
        // Create a vertical stack to hold the horizontal stacks
        let boardsView = UIStackView(arrangedSubviews: [rowOne, rowTwo, rowThree])
        boardsView.axis = .vertical
        boardsView.distribution = .fillEqually
        boardsView.spacing = 5
        boardsView.backgroundColor = .black
        
        // Add the vertical stack to the main view
        addSubview(boardsView)
        
        // Set up constraints
        boardsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            boardsView.centerYAnchor.constraint(equalTo: centerYAnchor),
            boardsView.centerXAnchor.constraint(equalTo: centerXAnchor),
            boardsView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1),
            boardsView.heightAnchor.constraint(equalTo: boardsView.widthAnchor, multiplier: 1/1),
        ])
    }
    
    private func createHStack() -> UIStackView {
        // Create three buttons for each horizontal stack
        let ofColOne = createBoard()
        let ofColTwo = createBoard()
        let ofColThree = createBoard()
        
        // Create a horizontal stack to hold the buttons
        let rows = UIStackView(arrangedSubviews: [ofColOne, ofColTwo, ofColThree])
        rows.axis = .horizontal
        rows.distribution = .fillEqually
        rows.spacing = 5
        rows.backgroundColor = .black
        
        return rows
    }
    
    private func createBoard() -> UIView {
        let board = MiniBoardView()
        return board
    }
}
