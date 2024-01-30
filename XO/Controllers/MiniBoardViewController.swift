//
//  A1MIniBoardViewController.swift
//  XO
//
//  Created by Mohamed Hussiani on 28/01/2024.
//

import UIKit

class MiniBoardViewController: UIViewController {
    
    // Create an instance for the mini board
    let board: [[UIButton]] = K.grid3by3.map { row in
        row.map { cell in
            DL.button()
        }
    }
    
    // Replace identical buttons with unique button instances
    // For type UIButton()
    // Input: [[a, a, a], [a, a, a], [a, a, a]]
    // Ouput: [[a1, a2, a3], [b1, b2, b3], [c1, c2, c3]]
    
    let BoardView = DL.VStackView()
    let RowOne = DL.HStackView()
    let RowTwo = DL.HStackView()
    let RowThree = DL.HStackView()
    

    // !!!The current player's turn - Temp Feature In this Class!!!
    var currentTurn = Turn.cross
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMiniBoardUI()
        
        for row in board {
            for cell in row {
                cell.addTarget(self, action: #selector(updateCell), for: .touchUpInside)
            }
        }

    }
    
    
    // MiniBoard Setup
    private func setupMiniBoardUI() {
        
        view.backgroundColor = .white
        
        // Add VStack
        view.addSubview(BoardView)
        
        // Constraints
        BoardView.translatesAutoresizingMaskIntoConstraints = false
        BoardView.centerYAnchor.constraint(equalTo: view.layoutMarginsGuide.centerYAnchor).isActive = true
        BoardView.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor).isActive = true
        BoardView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 1).isActive = true
        BoardView.heightAnchor.constraint(equalTo: BoardView.widthAnchor, multiplier: 1/1).isActive = true
        
        // Add Hstacks
        BoardView.addArrangedSubview(RowOne)
        BoardView.addArrangedSubview(RowTwo)
        BoardView.addArrangedSubview(RowThree)
        
        // Constraints
        for row in BoardView.arrangedSubviews {
            row.translatesAutoresizingMaskIntoConstraints = false
            row.heightAnchor.constraint(equalTo: row.heightAnchor, multiplier: 1/1).isActive = true
        }
        
        RowOne.addArrangedSubview(board[0][0])
        RowOne.addArrangedSubview(board[0][1])
        RowOne.addArrangedSubview(board[0][2])
        
        RowTwo.addArrangedSubview(board[1][0])
        RowTwo.addArrangedSubview(board[1][1])
        RowTwo.addArrangedSubview(board[1][2])
        
        RowThree.addArrangedSubview(board[2][0])
        RowThree.addArrangedSubview(board[2][1])
        RowThree.addArrangedSubview(board[2][2])
    }
    
    @objc func updateCell(for cell: UIButton) {
        if cell.currentImage == nil {
            if let validSymbol = CF.playerSymbol(currentTurn){
                if CF.checkPlayerIsCross(for: currentTurn){
                    CF.addMove(to: cell, for: currentTurn, their: validSymbol)
                    currentTurn = Turn.nought
                } else if CF.checkPlayerIsNought(for: currentTurn){
                    CF.addMove(to: cell, for: currentTurn, their: validSymbol)
                    currentTurn = .cross
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








