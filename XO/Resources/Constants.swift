//
//  Constants.swift
//  XO
//
//  Created by Mohamed Hussiani on 18/01/2024.
//

import Foundation
import UIKit

struct K {
    
    // Player's Avatar
    static let crossSymbol = UIImage(systemName: "xmark")!
    static let noughtSymbol = UIImage(systemName: "circle")!
    static let drawSymbol = UIImage(systemName: "equal")!
    
    // Adjust button image size relative to the sytem font size
    static let config = UIImage.SymbolConfiguration(font: .systemFont(ofSize: 50))
    
    // Default padding around mini boards in main board
    static let padding = 10.0
    
    // Default spacing for main board
    static let spacing = 5.0
    
    // Player UserImage Placeholder
    static let cross = "X"
    static let nought = "O"
    
    // Create a three by three gird to map against
    static let grid3by3 = Array(repeating: Array(repeating: (Any).self, count: 3), count: 3)

    static let maxGridColumn = 3
    
}
