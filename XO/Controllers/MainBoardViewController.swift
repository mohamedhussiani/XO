//
//  MiniBoardViewController.swift
//  XO
//
//  Created by Mohamed Hussiani on 28/01/2024.
//

import UIKit

class MainBoardViewController: UIViewController, Identifiable {
    
    // IMPORTANT: Sets the inital current turn of player -- TEMP HERE (maybe?)
    var currentTurn = Turn.cross
    
    // Create 3 by 3 matrix of a mini board instance of type class
    let boards = K.grid3by3.map { row in
        row.map { cell in
            MiniBoardViewController()
        }
    }
    
    // Create a unique identifier
    let id = UUID()
    
    let boardView = DL.VStackView()
    let rowOne = DL.HStackView()
    let rowTwo = DL.HStackView()
    let rowThree = DL.HStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMainBoardUI()
        
        print(MiniBoardIDs())
        
    }
    
    private func setupMainBoardUI() {
        
        // Main view background color
        view.backgroundColor = .white
        
        // Add VStack
        view.addSubview(boardView)
        
        // Constraints
        boardView.translatesAutoresizingMaskIntoConstraints = false
        boardView.centerYAnchor.constraint(equalTo: view.layoutMarginsGuide.centerYAnchor).isActive = true
        boardView.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor).isActive = true
        boardView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 1).isActive = true
        boardView.heightAnchor.constraint(equalTo: boardView.widthAnchor, multiplier: 1/1).isActive = true
        
        // Add Hstacks
        boardView.addArrangedSubview(rowOne)
        boardView.addArrangedSubview(rowTwo)
        boardView.addArrangedSubview(rowThree)
        
        // Modify spacing of board view
        boardView.spacing = K.spacing
        
        // Displays mini boards on main board
        let stacksInBoard = boardView.arrangedSubviews as! [UIStackView]
        var onRow = 0
        stacksInBoard.forEach { stack in
            for cell in 0..<K.maxGridColumn{
                stack.addArrangedSubview(boards[onRow][cell].view)
            }
            // Modify stack spacing
            stack.spacing = K.spacing
            onRow += 1
        }
        
        // Creates padding around each board cell
        boardView.arrangedSubviews.forEach { row in
            row.subviews.forEach { board in
                board.directionalLayoutMargins = NSDirectionalEdgeInsets(top: K.padding, leading: K.padding, bottom: K.padding, trailing: K.padding)
            }
        }
    }
    
    // Returns an array of the ids of the mini boards
    func MiniBoardIDs() -> [UUID] {
        var IDs = [UUID]()
        boards.forEach { row in
            row.forEach { miniBoard in
                let ID = miniBoard.id
                IDs.append(ID)
            }
        }
        return IDs
    }
    
}
