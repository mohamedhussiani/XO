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
    
    
    static let config = UIImage.SymbolConfiguration(font: .systemFont(ofSize: 50))
    
    // Player UserImage Placeholder
    static let cross = "X"
    static let nought = "O"
    
    // Repeats the same UIButton
    static let grid3by3 = Array(repeating: Array(repeating: (Any).self, count: 3), count: 3)

    
}
