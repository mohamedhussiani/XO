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
    let button = UIButton()
    button.setImage(nil, for: .normal)
    button.tintColor = .black
    button.contentScaleFactor = .greatestFiniteMagnitude
    button.backgroundColor = .white
    return button
}

// Button Size
let config = UIImage.SymbolConfiguration(font: .systemFont(ofSize: 50))

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

// A simple label with text 'Turn" - No funtionality, purely for design
let turnLabelTitle: UILabel = {
    let label = UILabel()
    label.text = "Turn"
    label.textColor = .black
    label.font = .systemFont(ofSize: 25, weight: .heavy)
    label.textColor = .black
    return label
}()

// Label to show which player's turn
let currentTurnLabel: UILabel = {
    let label = UILabel()
    // Cross goes first
    label.text = K.cross
    label.textColor = .black
    label.font = .systemFont(ofSize: 50, weight: .heavy)
    label.textColor = .black
    return label
}()

// Variable to store current player's turn
var currentTurn = Turn.cross

// Variable to switch the first player when game is reset
var firstTurn = Turn.cross

class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupUI()
        
        // Add plaer's move to board
        for cell in cells {
            cell.addTarget(self, action: #selector(updateCell), for: .touchUpInside)
        }
        
        
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        // Add label & label header + constraints
        view.addSubview(turnLabelTitle)
        view.addSubview(currentTurnLabel)
        
        turnLabelTitle.translatesAutoresizingMaskIntoConstraints = false
        turnLabelTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        turnLabelTitle.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor).isActive = true
        
        currentTurnLabel.translatesAutoresizingMaskIntoConstraints = false
        currentTurnLabel.topAnchor.constraint(equalTo: turnLabelTitle.layoutMarginsGuide.topAnchor, constant: 30).isActive = true
        currentTurnLabel.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor).isActive = true
        
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
//        for row in verticalStackView.arrangedSubviews {
//            row.translatesAutoresizingMaskIntoConstraints = false
//            row.heightAnchor.constraint(equalTo: row.heightAnchor, multiplier: 1/1).isActive = true
//        }
        
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
    
    // The action made by the cell
    @objc func updateCell(for cell: UIButton) {
        
        addMove(to: cell)
        
        if checkWinner(for: K.crossSymbol) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.resetBoard()
            }
        }
        
        if checkWinner(for: K.noughtSymbol) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.resetBoard()
            }
        }
        
        if checkBoardIsNotFull() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.resetBoard()
            }
        }
        
    }
    
    func verifyCell(for cell: UIButton, with symbol: UIImage) -> Bool {
        return (cell.image(for: .normal) == symbol)
    }
    
    func checkWinner(for symbol: UIImage) -> Bool {
        
        // Horizontal Victory
        if verifyCell(for: a1, with: symbol) && verifyCell(for: a2, with: symbol) && verifyCell(for: a3, with: symbol) {
            return true
        }
        if verifyCell(for: b1, with: symbol) && verifyCell(for: b2, with: symbol) && verifyCell(for: b3, with: symbol) {
            return true
        }
        if verifyCell(for: c1, with: symbol) && verifyCell(for: c2, with: symbol) && verifyCell(for: c3, with: symbol) {
            return true
        }
        
        // Vertical Victory
        if verifyCell(for: a1, with: symbol) && verifyCell(for: b1, with: symbol) && verifyCell(for: c1, with: symbol) {
            return true
        }
        if verifyCell(for: a2, with: symbol) && verifyCell(for: b2, with: symbol) && verifyCell(for: c2, with: symbol) {
            return true
        }
        if verifyCell(for: a3, with: symbol) && verifyCell(for: b3, with: symbol) && verifyCell(for: c3, with: symbol) {
            return true
        }
        
        // Diagonal Victory
        if verifyCell(for: a1, with: symbol) && verifyCell(for: b2, with: symbol) && verifyCell(for: c3, with: symbol) {
            return true
        }
        if verifyCell(for: a3, with: symbol) && verifyCell(for: b2, with: symbol) && verifyCell(for: c1, with: symbol) {
            return true
        }
        
        return false
    }
    
    
    func resetBoard() {
        for cell in cells {
            cell.setImage(nil, for: .normal)
        }
        
        if firstTurn == Turn.cross {
            firstTurn = Turn.nought
            currentTurnLabel.text = K.nought
        } else if firstTurn == Turn.nought{
            firstTurn = Turn.cross
            currentTurnLabel.text = K.cross
        }
        
        currentTurn = firstTurn
    }
    
    func checkBoardIsNotFull() -> Bool {
        for cell in cells {
            if cell.title(for: .normal) == nil {
                return false
            }
        }
        return true
    }
    
    func addMove(to cell: UIButton) {
        
        if cell.currentImage == nil {
            if currentTurn == Turn.cross {
                cell.setImage(K.crossSymbol, for: .normal)
                cell.setPreferredSymbolConfiguration(config, forImageIn: .normal)
                currentTurn = Turn.nought
                currentTurnLabel.text = K.nought
            } else if currentTurn == Turn.nought {
                cell.setImage(K.noughtSymbol, for: .normal)
                cell.setPreferredSymbolConfiguration(config, forImageIn: .normal)
                currentTurn = Turn.cross
                currentTurnLabel.text = K.cross
            }
        }
    }

    
}

