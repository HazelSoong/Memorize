//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Hazel on 13/6/2022.
//

import SwiftUI

struct EmojiMemoryGameView: View {
   
  
 @ObservedObject var game: EmojiMemoryGame
    var body: some View {
       //  ScrollView{
                
//                Label("Memorise!",systemImage: "")
//                        .labelStyle(.titleOnly)
//                        .font(.largeTitle)
             //   LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                   
            //        ForEach(game.cards) { card in
        
        AspectVGrid(items: game.cards, aspectRatio: 2/3) { card in
            if card.isMatched && !card.isFaceUp {
                Rectangle().opacity(0)
            } else {
                CardView(card: card)
                    .padding(4)
                    .onTapGesture {
                        game.choose(card)
                        
                    }
            }
                    }
            //    }
           // }
        
            .foregroundColor(.red)
            .buttonStyle(.bordered)
            .padding(.horizontal)
    }
    
   // @ViewBuilder
  //  private func cardView(for card: EmojiMemoryGame.Card) -> some View{
       
  //  }
}

struct CardView: View{
 
  let card: EmojiMemoryGame.Card
//    init(_ card: EmojiMemoryGame.Card){
//        self.card = card
//    }
    var body: some View{
        
        GeometryReader{ geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.conrnerRadius)
                if card.isFaceUp{
                shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                    Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 110-90))
                        .padding(5).opacity(0.5)
                    Text(card.content).font(font(in: geometry.size))}
                else if card.isMatched{
                    //if card matched, turn to clear
                    shape.opacity(0)
                }
                else{
                    shape.fill()
                }
             
        }
        }
      
       // .onTapGesture{isFaceUp = !isFaceUp}
        
    }
    
    private func font(in size:CGSize) -> Font{
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants{
        static let conrnerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.7
    }
    
}

struct memorize_Assignment1_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(game.cards.first!)
       return EmojiMemoryGameView(game: game)
            .preferredColorScheme(.light)
           
//        EmojiMemoryGameView(game: game)
//            .preferredColorScheme(.dark)
    }
}
