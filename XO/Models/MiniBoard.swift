//
//  MiniBoard.swift
//  XO
//
//  Created by Mohamed Hussiani on 27/01/2024.
//

import Foundation
import UIKit

struct MiniBoard {
    
    // VStack
    let grid: UIStackView
    
    // HStack
    let rowOne: UIStackView
    let rowTwo: UIStackView
    let rowThree: UIStackView
    
    // Row One Cells
    let a1: UIButton
    let a2: UIButton
    let a3: UIButton
    
    // Row Two Cells
    let b1: UIButton
    let b2: UIButton
    let b3: UIButton
    
    // Row Three Cells
    let c1: UIButton
    let c2: UIButton
    let c3: UIButton
    
    //      1 2 3
    // a    x x x
    // b    x x x
    // c    x x x
    
}
