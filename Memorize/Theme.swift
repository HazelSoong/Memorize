//  Model
//  Theme.swift
//  Memorize
//
//  Created by Hazel on 20/6/2022.
//

import Foundation

struct Theme{
    var name: String
    var emojis: Array<String>
    var numberOfPairsOfCard: Int
    var color: String
   
    //Task 6, hint 7
    init(name: String, emojis: Array<String>, numberOfPairOfCards: Int, color: String){
        self.name = name
        self.emojis = emojis
        self.numberOfPairsOfCard = numberOfPairOfCards > emojis.count ? emojis.count : numberOfPairOfCards
        self.color = color
    }
}
