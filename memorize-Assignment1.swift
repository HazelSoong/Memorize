//
//  memorize-Assignment1.swift
//  Memorize
//
//  Created by Hazel on 13/6/2022.
//

import SwiftUI

struct memorize_Assignment1: View {
   //@State var emojis = ["🚗","🚕","🚙","🚌","🚎","🏎","🚓","🚑","🚒","🚐"]
    //var emojiFlag = ["🏳️‍🌈","🏳️‍⚧️","🇺🇳","🇦🇫","🇦🇽","🇦🇱"]
    //var emojiAnimal = ["🐶"]
   //@State var emojiCount = 8
 @ObservedObject var viewModel: EmojiMemoryGame
    var body: some View {
       
            
        Label("Memorise!",systemImage: "")
                .labelStyle(.titleOnly)
                .font(.largeTitle)
            
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                   
                    ForEach(viewModel.cards) { card in CardView(card: card)
                        .aspectRatio(2/3,contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
                    }
                    
                    }
                }
            }
        
            .foregroundColor(.red)
            .buttonStyle(.bordered)
            .padding(.horizontal)
    }}
       



struct CardView: View{
 
   let card: MemoryGame<String>.Card
    
    var body: some View{
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp{
            shape.fill().foregroundColor(.white)
            shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)}
            else if card.isMatched{
                //if card matched, turn to clear
                shape.opacity(0)
            }
            else{
                shape.fill()
            }
         
    }
       // .onTapGesture{isFaceUp = !isFaceUp}
    }
    
}

struct memorize_Assignment1_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        memorize_Assignment1(viewModel: game)
            .preferredColorScheme(.light)
           
        memorize_Assignment1(viewModel: game)
            .preferredColorScheme(.dark)
    }
}
