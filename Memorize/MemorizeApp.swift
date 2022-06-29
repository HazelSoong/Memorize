//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Hazel on 13/6/2022.
//

import SwiftUI

@main
struct MemorizeApp: App {
    private let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
