
//
//  ContentView.swift
//  Memorize
//
//  Created by Hazel on 13/6/2022.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🚗","🚕","🚙","🚌","🚎","🏎"]
    var emojiCount = 5
    var body: some View {
        VStack{
        Label("Memorise!",systemImage: "bolt.fill")
                .labelStyle(.titleOnly)
                .font(.largeTitle)
        HStack{
            ForEach(emojis[0..<emojiCount], id: \.self,content: {em in CardView(content: em)})
        }
            
            HStack {
                Button("Sign In", action:{} )
                Button("Register", action: {}
                )
            }
            .buttonStyle(.bordered)
        }
    
        .foregroundColor(.red)
        .padding(.horizontal)
    }
       
}


struct CardView: View{
    var content:String
    @State var isFaceUp : Bool = true
    
    
    var body: some View{
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp{
            shape.fill().foregroundColor(.white)
            shape.stroke(lineWidth: 3)
            Text(content).font(.largeTitle)}
            else{
                shape.fill()
            }
         
    }
        .onTapGesture{isFaceUp = !isFaceUp}
    }
    
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
           
        ContentView()
            .preferredColorScheme(.dark)
    }
}
