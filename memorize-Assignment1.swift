//
//  memorize-Assignment1.swift
//  Memorize
//
//  Created by Hazel on 13/6/2022.
//

import SwiftUI

struct memorize_Assignment1: View {
   @State var emojis = ["π","π","π","π","π","π","π","π","π","π"]
    var emojiFlag = ["π³οΈβπ","π³οΈββ§οΈ","πΊπ³","π¦π«","π¦π½","π¦π±"]
    var emojiAnimal = ["πΆ"]
   @State var emojiCount = 8
    var body: some View {
        VStack{
            
        Label("Memorise!",systemImage: "")
                .labelStyle(.titleOnly)
                .font(.largeTitle)
            
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    //ζΎη€Ίηζ―emojis
                    ForEach(emojis[0..<emojiCount], id: \.self,content: {em in CardView(content: em).aspectRatio(2/3,contentMode: .fit)})
                }.foregroundColor(.red)
            }
        
            Spacer()
            HStack {
                
                vehicle
                Spacer()
                Flag
                Spacer()
                Animal
            }
            .buttonStyle(.bordered)
            .padding(.horizontal)
        }
    
        
        .padding(.horizontal)
    }
    
    var vehicle: some View {
        Button(action: {
            //ζΎη€Ίηζ°ιζ―Arrayηζ°ι
            emojiCount = emojis.count
            
            //δΈι’ζ―ζΎη€Ίθ‘->actionεηδΊ
            emojis = emojis.shuffled()
             },
               label:{
            VStack{
                Image(systemName:"car").font(.largeTitle)
                Text("Vehicle")
                .font(.caption)
               }} )
    }
    var Flag: some View {
        Button(action: {
            emojiCount = emojiFlag.count
            emojis = emojiFlag.shuffled()
        },
               label:{
            VStack{
                Image(systemName:"flag").font(.largeTitle)
                Text("Flag").font(.caption)
               }} )
    }
    var Animal: some View {
            Button(action: {
                emojiCount = emojiAnimal.count
                emojis = emojiAnimal.shuffled()
            },
                   label:{
                VStack{
                    Image(systemName:"pawprint").font(.largeTitle)
                    //θΏδΉεδΉθ‘
                    //.font(.system(size: 10))
                    Text("Animal").allowsTightening(true)
                    .font(.caption)}} )
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
            shape.strokeBorder(lineWidth: 3)
            Text(content).font(.largeTitle)}
            else{
                shape.fill()
            }
         
    }
        .onTapGesture{isFaceUp = !isFaceUp}
    }
    
}

struct memorize_Assignment1_Previews: PreviewProvider {
    static var previews: some View {
        memorize_Assignment1()
            .preferredColorScheme(.light)
           
        memorize_Assignment1()
            .preferredColorScheme(.dark)
    }
}
