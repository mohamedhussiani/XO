//
//  MiniBoardViewController.swift
//  XO
//
//  Created by Mohamed Hussiani on 28/01/2024.
//

import UIKit

class MainBoardViewController: UIViewController {
    
    let board: [[UIViewController]] = K.grid3by3.map { row in
        row.map { cell in
            MiniBoardViewController()
        }
    }
    
    let BoardView = DL.VStackView()
    let RowOne = DL.HStackView()
    let RowTwo = DL.HStackView()
    let RowThree = DL.HStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupMainBoardUI()

}


    private func setupMainBoardUI() {
        
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
        
        
        // Modify spacing in main board
        BoardView.spacing = 5
        RowOne.spacing = 5
        RowTwo.spacing = 5
        RowThree.spacing = 5
        
        
        // Displays mini boards on main board
        RowOne.addArrangedSubview(board[0][0].view)
        RowOne.addArrangedSubview(board[0][1].view)
        RowOne.addArrangedSubview(board[0][2].view)
        
        RowTwo.addArrangedSubview(board[1][0].view)
        RowTwo.addArrangedSubview(board[1][1].view)
        RowTwo.addArrangedSubview(board[1][2].view)
        
        RowThree.addArrangedSubview(board[2][0].view)
        RowThree.addArrangedSubview(board[2][1].view)
        RowThree.addArrangedSubview(board[2][2].view)
        
        // Creates padding around each board cell
        RowOne.arrangedSubviews.forEach { board in
            board.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        }
        RowTwo.arrangedSubviews.forEach { board in
            board.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        }
        RowThree.arrangedSubviews.forEach { board in
            board.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        }
        
    }

}

//        BoardView.arrangedSubviews.forEach { row in
//            row.translatesAutoresizingMaskIntoConstraints = false
//            row.heightAnchor.constraint(equalTo: row.heightAnchor, multiplier: 1/1).isActive = true
//        }
