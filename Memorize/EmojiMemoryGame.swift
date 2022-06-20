//  viewmodel
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Hazel on 15/6/2022.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    init(){
        theme = EmojiMemoryGame.themes.randomElement()!//A new game should use a randomly chosen theme
        theme.emojis.shuffle()
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
    //type var/func 静态变量，本质是global变量，但现在包括了EmojiMemoryGame
    //两个初始化相冲突，考虑是否要做成全局变量，init - static，可以删除static var .前面的部分 e.g：19 EmojiMemoryGame.createMemoryGame -> createMemoryGame
   
    static var themes: Array<Theme> = [
    Theme(name: "Vehicles",
          emojis: ["🚗","🚕","🚙","🚌","🚎","🏎","🚓","🚑","🚒","🚐"],
          numberOfPairOfCards: 5,
          color: "blue"),
    
    Theme(name: "Animal",
          emojis: ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐻‍❄️","🐨","🐯","🦁","🐮","🐷","🐸","🐵","🦉","🦄","🦋","🐙","🦀","🐳","🦒","🦭","🦩","🐿","🦔","🐲"],
          numberOfPairOfCards: 6,
          color: "brown"),
    
    Theme(name: "Flags",
          emojis: ["🏳️‍🌈","🏳️‍⚧️","🇺🇳","🇦🇫","🇦🇽","🇦🇱"],
          numberOfPairOfCards: 4,
          color: "red"),
    
    Theme(name: "Fruit",
          emojis: ["🍎","🍐","🍊","🍋","🍌","🍉","🍇","🍓","🫐","🍈","🍒","🍑","🍍","🥭","🥥","🥝","🍆","🥑"],
          numberOfPairOfCards: 7,
          color: "green"),
    
    Theme(name: "Food",
          emojis: ["🥐","🥯","🥨","🧀","🌽","🥞","🍳","🍖","🍔","🍟","🍕","🌮","🍱","🍤","🍭","🍯","🍩","🧁"],
          numberOfPairOfCards: 8,
          color: "yellow"),
    
    Theme(name: "Sports",
          emojis: ["⚽️","🏀","🏈","⚾️","🏓","🥏","🏸","🏑","🪁","🥊","🤿","🥋","🪂","🛼","🎣"],
          numberOfPairOfCards: 9,
          color: "purple")]
    
    static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairsOfCard) { pairIndex in theme.emojis[pairIndex]}
    }
   //@Published表示当这个发生变化，使用objectWillChange点send，告诉全局知道有了这个变化
    @Published private var model: MemoryGame<String>
    
    private var theme: Theme
    var themeName: String{
        return theme.name
    }
    var themeColor: Color{
        switch theme.color{
        case "red":
            return .red
        case "green":
            return .green
        case "blue":
            return .blue
        case "brown":
            return .brown
        case "yellow":
            return .yellow
        case "purple":
            return .purple
        default:
            return .black
        
        }
    }
    
    var score : Int{
        return model.score
    }
    //last arguement to the function can delete,so below sentence has been deleted "createCardContent"; _ is repleacing index
   
    //read only
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    //MARK: - Intent(s)
    func choose(_ card: MemoryGame<String>.Card){
        //objectWillChange.send()
        model.choose(card)
    }
    func newGame(){
        theme = EmojiMemoryGame.themes.randomElement()!//A new game should use a randomly chosen theme
        theme.emojis.shuffle()
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
}
