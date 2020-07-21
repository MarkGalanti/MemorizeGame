//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Mark Galanti on 7/17/20.
//  Copyright © 2020 Mark Galanti. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
        var body: some View {
            VStack {
                Grid(items: viewModel.cards) { card in
                    CardView(card: card).onTapGesture {
                        self.viewModel.choose(card: card)
                    }
                .padding(5)
                }
                .padding()
                .foregroundColor(self.viewModel.theme.color)
                .font(Font.largeTitle)
                
                Spacer()
                
                Text("Score: \(viewModel.score)")
                
                Spacer()
                
                Text(viewModel.theme.name).font(.largeTitle).padding(.bottom)
                
                Button(action: {
                    withAnimation(.easeOut) {
                        self.viewModel.newGame(oldTheme: self.viewModel.theme)
                    }
                }, label: {
                    Text("New Game")
                })
            }
        }
    
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
        
    }
    
    func body(for size: CGSize) -> some View {
        ZStack {
            if self.card.isFaceUp {
                RoundedRectangle(cornerRadius: connerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: connerRadius).stroke(lineWidth: edgeLineWidth)
                Text(self.card.content)
            } else {
                if !card.isMatched {
                    RoundedRectangle(cornerRadius: connerRadius).fill()
                }
            }
            }.font(Font.system(size: fontSize(for: size)))
    }

    
    // MARK: - Drawing Constants
    
    let connerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3
    let fontScaleFactor: CGFloat = 0.75
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * fontScaleFactor
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
