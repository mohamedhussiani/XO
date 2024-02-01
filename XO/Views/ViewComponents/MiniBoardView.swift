//
//  MiniBoardView.swift
//  XO
//
//  Created by Mohamed Hussiani on 28/01/2024.
//

import UIKit

class MiniBoardView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupMiniBoardUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupMiniBoardUI()
    }
    
    private func setupMiniBoardUI() {
        
        backgroundColor = .white
        
    }
    

    
}
