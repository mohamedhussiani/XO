//
//  Layout.swift
//  XO
//
//  Created by Mohamed Hussiani on 27/01/2024.
//

import Foundation
import UIKit

struct DL {
    
    // Board Columns
    static func VStackView() -> UIStackView {
        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.distribution = .fillEqually
        verticalStackView.alignment = .fill
        verticalStackView.spacing = 2.5
        verticalStackView.backgroundColor = .black
        return verticalStackView
    }
    
    // Board Rows
    static func HStackView() -> UIStackView {
        let horizontalStackView = UIStackView()
        horizontalStackView.axis = .horizontal
        horizontalStackView.alignment = .fill
        horizontalStackView.distribution = .fillEqually
        horizontalStackView.spacing = 2.5
        horizontalStackView.backgroundColor = .black
        return horizontalStackView
    }
    
    // Standard Button
    static func button() -> UIButton {
        let button = UIButton()
        button.setImage(nil, for: .normal)
        button.tintColor = .black
        button.backgroundColor = .white
        return button
    }
    
    // Normal label with title "Turn"
    static func label1() ->  UILabel {
        let label = UILabel()
        label.text = "Turn"
        label.textColor = .black
        label.font = .systemFont(ofSize: 25, weight: .heavy)
        label.textColor = .black
        return label
    }
    
    static func label2() -> UILabel {
        let label = UILabel()
        // Cross goes first
        label.text = K.cross
        label.textColor = .black
        label.font = .systemFont(ofSize: 50, weight: .heavy)
        label.textColor = .black
        return label
    }
    
    // Image to show current player
    static func image() ->  UIImageView {
        // Cross goes first
        let imageView = UIImageView(image: K.crossSymbol)
        imageView.frame(forAlignmentRect: CGRect())
        return imageView
    }
    
}

