//
//  Layout.swift
//  XO
//
//  Created by Mohamed Hussiani on 27/01/2024.
//

import Foundation
import UIKit

struct DefaultLayout {
    
    func VStackView() -> UIStackView {
        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.distribution = .fillEqually
        verticalStackView.alignment = .fill
        verticalStackView.spacing = 5.0
        verticalStackView.backgroundColor = .black
        return verticalStackView
    }
    
    func HStackView() -> UIStackView {
        let horizontalStackView = UIStackView()
        horizontalStackView.axis = .horizontal
        horizontalStackView.alignment = .fill
        horizontalStackView.distribution = .fillEqually
        horizontalStackView.spacing = 5.0
        horizontalStackView.backgroundColor = .black
        return horizontalStackView
    }
    
    func button() -> UIButton {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 50, weight: .heavy)
        button.backgroundColor = .white
        return button
    }
    
}

