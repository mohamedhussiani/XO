//
//  MainGameViewController.swift
//  XO
//
//  Created by Mohamed Hussiani on 26/01/2024.
//

import UIKit

func defaultHStackView() -> UIStackView {
    let horizontalStackView = UIStackView()
    horizontalStackView.axis = .horizontal
    horizontalStackView.alignment = .fill
    horizontalStackView.distribution = .fillEqually
    horizontalStackView.spacing = 5.0
    horizontalStackView.backgroundColor = .black
    return horizontalStackView
}

func defaultButton() -> UIButton {
    let button = UIButton(frame: CGRect())
    button.setTitle("", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 50, weight: .heavy)
    button.backgroundColor = .white
    return button
}

let grid = [UIButton]()

// Create the components

let verticalStackView: UIStackView = {
    let verticalStackView = UIStackView()
    verticalStackView.axis = .vertical
    verticalStackView.distribution = .fillEqually
    verticalStackView.alignment = .fill
    verticalStackView.spacing = 5.0
    verticalStackView.backgroundColor = .black
    return verticalStackView
}()

let rowOne = defaultHStackView()
let rowTwo = defaultHStackView()
let rowThree = defaultHStackView()

let a1 = defaultButton()
let a2 = defaultButton()
let a3 = defaultButton()

let b1 = defaultButton()
let b2 = defaultButton()
let b3 = defaultButton()

let c1 = defaultButton()
let c2 = defaultButton()
let c3 = defaultButton()

let cells = [a1, a2, a3, b1, b2, b3, c1, c2, c3]

class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupUI()
        
        
        for cell in cells {
            cell.addTarget(self, action: #selector(updateButton), for: .touchUpInside)
        }
        
        
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        // Add VStack
        view.addSubview(verticalStackView)
        
        // Constraints
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.centerYAnchor.constraint(equalTo: view.layoutMarginsGuide.centerYAnchor).isActive = true
        verticalStackView.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor).isActive = true
        verticalStackView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.9).isActive = true
        verticalStackView.heightAnchor.constraint(equalTo: verticalStackView.widthAnchor, multiplier: 1/1).isActive = true
        
        // Add Hstacks
        verticalStackView.addArrangedSubview(rowOne)
        verticalStackView.addArrangedSubview(rowTwo)
        verticalStackView.addArrangedSubview(rowThree)
        
        // Constraints
        for row in verticalStackView.arrangedSubviews {
            row.translatesAutoresizingMaskIntoConstraints = false
            row.heightAnchor.constraint(equalTo: row.heightAnchor, multiplier: 1/1).isActive = true
        }
        
        rowOne.addArrangedSubview(a1)
        rowOne.addArrangedSubview(a2)
        rowOne.addArrangedSubview(a3)
        
        rowTwo.addArrangedSubview(b1)
        rowTwo.addArrangedSubview(b2)
        rowTwo.addArrangedSubview(b3)
        
        rowThree.addArrangedSubview(c1)
        rowThree.addArrangedSubview(c2)
        rowThree.addArrangedSubview(c3)
    }
    
    @objc func updateButton(for button: UIButton) {
    
            if (button.currentTitle == "X") {
                button.setTitle("O", for: .normal)
            } else {
                button.setTitle("X", for: .normal)
            }
    
        }
    

    
}

