//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Mark Galanti on 7/17/20.
//  Copyright © 2020 Mark Galanti. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String>
    private(set) var theme: Theme = Theme.getRandomTheme()
    
    init() {
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
    
    static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        let emojis: Array<String> = Theme.getShuffledEmojis(theme: theme)
        return MemoryGame<String>(numberOfPairsOfCards: theme.numberOfCardPairs ?? Int.random(in: 2..<theme.emojiSet.count)) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    
    // MARK: - Acess to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    var score: Int {
        model.score
    }
    
    var color: Color {
        theme.color
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
  
    func newGame(oldTheme: Theme){
        let newTheme = Theme.getRandomTheme()
        if newTheme.id != oldTheme.id {
            model = EmojiMemoryGame.createMemoryGame(theme: newTheme)
        } else {
            newGame(oldTheme: oldTheme)
    }
}
}
