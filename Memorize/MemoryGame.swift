//
//  MemoryGame.swift
//  Memorize
//
//  Created by Hazel on 15/6/2022.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int?{
        get{ cards.indices.filter({ cards[$0].isFaceUp}).oneAndOnly
         // let faceUpCardIndices = cards.indices.filter({ cards[$0].isFaceUp})
//     up one line replace below
 //       var faceUpCardIndices = [Int]()
//        for index in cards.indices{
//            if cards[index].isFaceUp{
//                faceUpCardIndices.append(index)
//            }
//        }
          //  return faceUpCardIndices.oneAndOnly
//
    }
        set { cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue)}
            
 //           for index in cards.indices{ cards[index].isFaceUp = (index == newValue)
//                if index != newValue{
//                    cards[index].isFaceUp = false
//                }else {
//                    cards[index].isFaceUp = true
//                }
        }
        }
        
    
    //cards is an Array
    private(set) var cards: Array<Card>
    
   mutating func choose(_ card: Card) {
     //  if let chosenIndex = index(of: card){
       if let chosenIndex = cards.firstIndex(where: { $0.id == card.id}),
            !cards[chosenIndex].isFaceUp,
            !cards[chosenIndex].isMatched//matched的卡片不可以再点击
       {
      //这个是复制了一次，不是直接改变
       //var chosenCard = cards[chosenIndex]
           if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard{
               if cards[chosenIndex].content == cards[potentialMatchIndex].content{
                   cards[chosenIndex].isMatched = true
                   cards[potentialMatchIndex].isMatched = true
               }
               cards[chosenIndex].isFaceUp = true
           }else{
               indexOfTheOneAndOnlyFaceUpCard = chosenIndex
           }
           
           
          }
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
        cards = []
        // add numberOfPairsOfCards *2 cards to cards array
        
        for pairIndex in 0..<numberOfPairsOfCards{
            //createCardContent is a function
            let content = createCardContent(pairIndex)
            //cards.append is 固定搭配向Array中写入信息
            cards.append(Card(content: content, id:pairIndex*2))
            cards.append(Card(content: content, id:pairIndex*2+1))
        }
        
    }
    
    struct Card:Identifiable {
        
        
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
        var id: Int
    }
}

extension Array{
    var oneAndOnly: Element?{
        if count == 1{
        return first
                } else {
                   return nil
               }
    }
}
