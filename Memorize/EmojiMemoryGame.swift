//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Hazel on 15/6/2022.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    //type var/func 静态变量，本质是global变量，但现在包括了EmojiMemoryGame
    //两个初始化相冲突，考虑是否要做成全局变量，init - static，可以删除static var .前面的部分 e.g：19 EmojiMemoryGame.createMemoryGame -> createMemoryGame
   private static let emojis = ["🚗","🚕","🚙","🚌","🚎","🏎","🚓","🚑","🚒","🚐"]
   private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in emojis[pairIndex]}
    }
   //@Published表示当这个发生变化，使用objectWillChange点send，告诉全局知道有了这个变化
    @Published private var model = createMemoryGame()
    
    //last arguement to the function can delete,so below sentence has been deleted "createCardContent"; _ is repleacing index
   
    //read only
    var cards: Array<Card>{
        return model.cards
    }
    
    //MARK: - Intent(s)
    func choose(_ card: Card){
        //objectWillChange.send()
        model.choose(card)
    }
}
