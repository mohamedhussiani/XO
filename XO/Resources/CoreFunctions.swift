//
//  Core Functions.swift
//  XO
//
//  Created by Mohamed Hussiani on 28/01/2024.
//

import Foundation
import UIKit

struct CF {
    
    // Add move to board
    static func addMove(to cell: UIButton, for currentTurn: Turn, their symbol: UIImage) {
        // Cross
        if currentTurn == .cross {
            cell.setImage(symbol, for: .normal)
            cell.setPreferredSymbolConfiguration(K.config, forImageIn: .normal)
        }
        
        // Nought
        if currentTurn == .nought {
            cell.setImage(symbol, for: .normal)
            cell.setPreferredSymbolConfiguration(K.config, forImageIn: .normal)
        }
    }

    // Returns true if button image in cell matches the symbol
    static func verifyCell(for cell: UIButton, with symbol: UIImage) -> Bool {
        return (cell.image(for: .normal) == symbol)
    }
    
    
    
    // Resets the board if cells are full
    static func resetBoard(for board: [[UIButton]]) {
        for row in board {
            for cell in row {
                cell.setImage(nil, for: .normal)
            }
        }
    }
    
    // Returns true if board is full, not when there is a draw
    static func checkIsPlayable(for board: [[UIButton]]) -> Bool {
        for row in board {
            for cell in row {
                if cell.title(for: .normal) == nil {
                    return false
                }
            }
        }
        return true
    }
    
    // Returns true if win conditions is met by passed in player's symbol
    static func checkForWinner(for board: [[UIButton]], with symbol: UIImage) -> Bool {
        
        
        // Horizontal Victory
        if verifyCell(for: board[0][0], with: symbol) && verifyCell(for: board[0][1], with: symbol) && verifyCell(for: board[0][2], with: symbol) {
            return true
        }
        if verifyCell(for: board[1][0], with: symbol) && verifyCell(for: board[1][1], with: symbol) && verifyCell(for: board[1][2], with: symbol) {
            return true
        }
        if verifyCell(for: board[2][0], with: symbol) && verifyCell(for: board[2][1], with: symbol) && verifyCell(for: board[2][2], with: symbol) {
            return true
        }
        
        // Vertical Victory
        if verifyCell(for: board[0][0], with: symbol) && verifyCell(for: board[1][0], with: symbol) && verifyCell(for: board[2][0], with: symbol) {
            return true
        }
        if verifyCell(for: board[0][1], with: symbol) && verifyCell(for: board[1][1], with: symbol) && verifyCell(for: board[2][1], with: symbol) {
            return true
        }
        if verifyCell(for: board[0][2], with: symbol) && verifyCell(for: board[1][2], with: symbol) && verifyCell(for: board[2][2], with: symbol) {
            return true
        }
        
        // Diagonal Victory
        if verifyCell(for: board[0][0], with: symbol) && verifyCell(for: board[1][1], with: symbol) && verifyCell(for: board[2][2], with: symbol) {
            return true
        }
        if verifyCell(for: board[0][2], with: symbol) && verifyCell(for: board[1][1], with: symbol) && verifyCell(for: board[2][0], with: symbol) {
            return true
        }
        return false
    }
    
    // Returns true if cross
    static func checkPlayerIsCross(for currentTurn: Turn) -> Bool {
        if currentTurn == .cross {
            return true
        }
        return false
    }
    
    // Return true if nought
    static func checkPlayerIsNought(for currentTurn: Turn) -> Bool {
        if currentTurn == .nought {
            return true
        }
        return false
    }
    
    // Return current turn image
    static func playerSymbol(_ currentTurn: Turn) -> UIImage? {
        if currentTurn == .cross {
            return K.crossSymbol
        }
        if currentTurn == .nought {
            return K.noughtSymbol
        }
        return nil
    }
    
}

