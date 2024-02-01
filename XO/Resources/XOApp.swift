//
//  File.swift
//  XO
//
//  Created by Mohamed Hussiani on 01/02/2024.
//

import SwiftUI

// Removes the need for an app and scene delegate - loads swift UI file
// Can it load UIKit view controllers?

//@main
struct XO: App {
    var body: some Scene {
        WindowGroup {
            CasualPlayUI()
        }
    }
}

