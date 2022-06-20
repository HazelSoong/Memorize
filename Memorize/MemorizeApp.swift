//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Hazel on 13/6/2022.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            memorize_Assignment1(viewModel: game)
        }
    }
}
