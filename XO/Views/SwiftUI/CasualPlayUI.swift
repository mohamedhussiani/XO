//
//  CasualPlay.swift
//  XO
//
//  Created by Mohamed Hussiani on 01/02/2024.
//

import SwiftUI

struct CasualPlayUI: View {
    var body: some View {
        VStack {
            CasualPlay()
        }
    }
}

struct CasualPlay_Previews: PreviewProvider {
    static var previews: some View {
        CasualPlayUI()
    }
}

// CasualPlayViewController
struct CasualPlay: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> CasualPlayViewController {
        let vc = CasualPlayViewController()
        // Do some configurations here if needed.
        return vc
    }
    
    func updateUIViewController(_ uiViewController: CasualPlayViewController, context: Context) {
        // Updates the state of the specified view controller with new information from SwiftUI.
    }
    
    typealias UIViewControllerType = CasualPlayViewController
}
