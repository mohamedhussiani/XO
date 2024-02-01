//
//  A1MIniBoardViewController.swift
//  XO
//
//  Created by Mohamed Hussiani on 28/01/2024.
//

import UIKit

class MiniBoardViewController: UIViewController, Identifiable {
    
    // Create an instance for the cells in the mini board
    let cells = K.grid3by3.map { row in
        row.map { cell in
            DL.button()
        }
    }
    
    // Create a unique identifier 
    let id = UUID()
    
    // Replace identical buttons with unique button instances
    // For type UIButton()
    // Input: [[a, a, a], [a, a, a], [a, a, a]]
    // Ouput: [[a1, a2, a3], [b1, b2, b3], [c1, c2, c3]]
    
    let boardView = DL.VStackView()
    let rowOne = DL.HStackView()
    let rowTwo = DL.HStackView()
    let rowThree = DL.HStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMiniBoardUI()
        
        for row in cells {
            for cell in row {
                cell.addTarget(self, action: #selector(updateCell), for: .touchUpInside)
            }
        }
        
    }
    

    
    // MiniBoard Setup
    private func setupMiniBoardUI() {
        
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
        
        // Constraints
        for row in boardView.arrangedSubviews {
            row.translatesAutoresizingMaskIntoConstraints = false
            row.heightAnchor.constraint(equalTo: row.heightAnchor, multiplier: 1/1).isActive = true
        }
        
        // Add each playable cell (button) to mini board
        let stacksInBoard = boardView.arrangedSubviews as! [UIStackView]
        var onRow = 0
        stacksInBoard.forEach { stack in
            for cell in 0..<K.maxGridColumn {
                stack.addArrangedSubview(cells[onRow][cell])
            }
            onRow += 1
        }
  
    }
    
    // Action method for the cell in miniboard
    @objc func updateCell(for cell: UIButton){
        if cell.currentImage == nil {
            if let validSymbol = CF.playerSymbol(currentTurn){
                if CF.checkPlayerIsCross(for: currentTurn){
                    CF.addMove(to: cell, for: currentTurn, their: validSymbol)
                    currentTurn = Turn.nought
                    print(self.id)
                } else if CF.checkPlayerIsNought(for: currentTurn){
                    CF.addMove(to: cell, for: currentTurn, their: validSymbol)
                    currentTurn = Turn.cross
                    print(self.id)
                }
            }
        }
    }
    
}
    

    
    
//    @objc func updateCell(for cell: UIButton) {
//
//        addMove(to: cell)
//
//        if checkWinner(for: K.crossSymbol) {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
//                self.resetBoard()
//            }
//        }
//
//        if checkWinner(for: K.noughtSymbol) {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
//                self.resetBoard()
//            }
//        }
//
//        if checkBoardIsNotFull() {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
//                self.resetBoard()
//            }
//        }
//
//    }








