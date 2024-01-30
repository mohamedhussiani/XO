//
//  Symbols.swift
//  XO
//
//  Created by Mohamed Hussiani on 18/01/2024.
//

import Foundation

enum Turn {
    case cross, nought
}

enum TurnError: Error {
    case invalidTurn
}
