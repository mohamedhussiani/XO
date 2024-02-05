//
//  MiniBoardView.swift
//  XO
//
//  Created by Mohamed Hussiani on 04/02/2024.
//

import UIKit

class MiniBoardView: UIView, Identifiable {
    
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
        let cellsView = UIStackView(arrangedSubviews: [rowOne, rowTwo, rowThree])
        cellsView.axis = .vertical
        cellsView.distribution = .fillEqually
        cellsView.spacing = 2.5
        cellsView.backgroundColor = .black
        
        let paddingLayer = UIStackView(arrangedSubviews: [cellsView])
        paddingLayer.backgroundColor = .systemBackground
        paddingLayer.distribution = .fill
        
        // Add the vertical stack to the main view
        addSubview(paddingLayer)
        
        // Set up constraints
        paddingLayer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            paddingLayer.centerYAnchor.constraint(equalTo: centerYAnchor),
            paddingLayer.centerXAnchor.constraint(equalTo: centerXAnchor),
            paddingLayer.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1),
            paddingLayer.heightAnchor.constraint(equalTo: paddingLayer.widthAnchor, multiplier: 1/1),
        ])
        
        paddingLayer.isLayoutMarginsRelativeArrangement = true
        paddingLayer.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
    }
    
    private func createHStack() -> UIStackView {
        // Create three buttons for each horizontal stack
        let ofColOne = createCell()
        let ofColTwo = createCell()
        let ofColThree = createCell()
        
        // Create a horizontal stack to hold the buttons
        let rows = UIStackView(arrangedSubviews: [ofColOne, ofColTwo, ofColThree])
        rows.axis = .horizontal
        rows.distribution = .fillEqually
        rows.spacing = 2.5
        rows.backgroundColor = .black
        
        return rows
    }
    
    private func createCell() -> UIButton {
        let cell = UIButton(type: .system)
        cell.setImage(nil, for: .normal)
        cell.tintColor = .black
        cell.backgroundColor = .white
        cell.addTarget(self, action: #selector(cellTapped), for: .touchUpInside)
        return cell
    }
    
    @objc private func cellTapped(_ sender: UIButton) {
        if let image = sender.currentImage {
            print("Cell tapped: \(image)")
        } else {
            print("Cell has no image")
        }
    }
    
}
