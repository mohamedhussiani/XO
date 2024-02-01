//
//  CasualPlay.swift
//  XO
//
//  Created by Mohamed Hussiani on 01/02/2024.
//

import SwiftUI

// Use SwiftUI for observing changes in board to update turn label

struct MainBoard: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> MainBoardViewController {
        let vc = MainBoardViewController()
        // Do some configurations here if needed.
        return vc
    }
    
    func updateUIViewController(_ uiViewController: MainBoardViewController, context: Context) {
        // Updates the state of the specified view controller with new information from SwiftUI.
    }
    
    typealias UIViewControllerType = MainBoardViewController
}

struct CasualPlayUI: View {
    var body: some View {
        MainBoard()
    }
}

struct CasualPlay_Previews: PreviewProvider {
    static var previews: some View {
        CasualPlayUI()
    }
}
