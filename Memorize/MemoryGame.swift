//  Model
//  MemoryGame.swift
//  Memorize
//
//  Created by Hazel on 15/6/2022.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int?
    //cards is an Array
    private(set) var cards: Array<Card>
    
    private(set) var score = 0
    
   mutating func choose(_ card: Card) {
     //  if let chosenIndex = index(of: card){
       if let chosenIndex = cards.firstIndex(where: { $0.id == card.id}),
            !cards[chosenIndex].isFaceUp,
            !cards[chosenIndex].isMatched//matched的卡片不可以再点击
       {
      //这个是复制了一次，不是直接改变
       //var chosenCard = cards[chosenIndex]
           if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard{
             //if there was already one and only one card face up ...
               if cards[chosenIndex].content == cards[potentialMatchIndex].content{
                   //if both cards have the same content, match them
                   cards[chosenIndex].isMatched = true
                   cards[potentialMatchIndex].isMatched = true
                   score += 2
                   
               }
               else { if cards[chosenIndex].hasAlreadyBeenSeen || cards[potentialMatchIndex].hasAlreadyBeenSeen {
                   score -= 1
                   
               }}
              indexOfTheOneAndOnlyFaceUpCard = nil
           }else {
               for index in cards.indices{
                   if cards[index].isFaceUp{
                   cards[index].isFaceUp = false
                       cards[index].hasAlreadyBeenSeen = true}
                   
               }
               indexOfTheOneAndOnlyFaceUpCard = chosenIndex
           }
           
           
           cards[chosenIndex].isFaceUp.toggle()}
        print("d=\(cards)")
        
    }
//    func index(of card: Card) -> Int?{
//        for index in 0..<cards.count {
//            if cards[index].id == card.id{
//               return index
//            }
//       }
//        return nil
   // }
   
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        // add numberOfPairsOfCards *2 cards to cards array
        
        for pairIndex in 0..<numberOfPairsOfCards{
            //createCardContent is a function
            let content = createCardContent(pairIndex)
            //cards.append is 固定搭配向Array中写入信息
            cards.append(Card(content: content, id:pairIndex*2))
            cards.append(Card(content: content, id:pairIndex*2+1))
        }
        cards.shuffle()//Task 13
    }
    
    struct Card:Identifiable {
        
        
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var hasAlreadyBeenSeen = false
        var content: CardContent
        var id: Int
    }
}

