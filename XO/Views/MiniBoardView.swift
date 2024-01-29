//
//  MiniBoardView.swift
//  XO
//
//  Created by Mohamed Hussiani on 28/01/2024.
//

import UIKit



class MiniBoardView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupMiniBoardUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupMiniBoardUI()
    }
    
    let grid = DL.VStackView()
    
    let rowOne = DL.HStackView()
    let rowTwo = DL.HStackView()
    let rowThree = DL.HStackView()
    
    let a1 = DL.button()
    let a2 = DL.button()
    let a3 = DL.button()
    
    let b1 = DL.button()
    let b2 = DL.button()
    let b3 = DL.button()
    
    let c1 = DL.button()
    let c2 = DL.button()
    let c3 = DL.button()
    
    private func setupMiniBoardUI() {
        
        backgroundColor = .white
        
        // Add VStack
        
        // Constraints
        
        
        
//        grid.addArrangedSubview(rowOne)
//        grid.addArrangedSubview(rowTwo)
//        grid.addArrangedSubview(rowThree)
//
//        rowOne.addArrangedSubview(a1)
//        rowOne.addArrangedSubview(a2)
//        rowOne.addArrangedSubview(a3)
//
//        rowTwo.addArrangedSubview(b1)
//        rowTwo.addArrangedSubview(b2)
//        rowTwo.addArrangedSubview(b3)
//
//        rowThree.addArrangedSubview(c1)
//        rowThree.addArrangedSubview(c2)
//        rowThree.addArrangedSubview(c3)
        
        
    }
    

    
}
