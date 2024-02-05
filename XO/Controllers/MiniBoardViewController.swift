//
//  A1MIniBoardViewController.swift
//  XO
//
//  Created by Mohamed Hussiani on 28/01/2024.
//

import UIKit

class MiniBoardViewController: UIViewController {
    
    // MiniBoardView
    private let miniboard = MiniBoardView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MiniBoard Setup
    private func setupView() {
        
        view.backgroundColor = .white
        
        view.addSubview(miniboard)
        
        // Set up contraints for MiniBoard
        miniboard.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            miniboard.centerYAnchor.constraint(equalTo: view.layoutMarginsGuide.centerYAnchor),
            miniboard.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            miniboard.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 1),
            miniboard.heightAnchor.constraint(equalTo: miniboard.widthAnchor, multiplier: 1/1),
        ])
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








