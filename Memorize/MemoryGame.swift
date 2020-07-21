//
//  MemoryGame.swift
//  Memorize
//
//  Created by Mark Galanti on 7/17/20.
//  Copyright © 2020 Mark Galanti. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
    var cards: Array<Card>
    var score = 0
    
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.only }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
        }
    }
}
    mutating func choose(card: Card) {
        print("card chosen: \(score)")

        if let chosenIndex: Int = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            // if card is not yet seen, then set to seen

            // cant choose same card twice
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                // if the card is a match
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += 2
                } else if card.seen {
                    score -= 1
                }
            self.cards[chosenIndex].isFaceUp = true
            // first card so set it to chosenIndex
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            if !card.seen{
                self.cards[chosenIndex].seen = true
            }
        }
        
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var seen: Bool = false
        var content: CardContent
        var id: Int
    }
}
