//
//  File.swift
//  Memorize
//
//  Created by Mark Galanti on 7/20/20.
//  Copyright © 2020 Mark Galanti. All rights reserved.
//

import SwiftUI

// Architect the concept of a “theme” into your game.
// A theme consists of a name for the theme, a set of emoji to use, a number of cards to show (which, for at least one,
// but not all themes, should be random), and an appropriate color to use to draw (e.g.
// orange would be appropriate for a Halloween theme).

struct Theme: Identifiable {
    let name: String
    let emojiSet: [String]
    let numberOfCardPairs: Int?
    let color: Color
    let id: Int

    static private var themes = [
        Theme (
            name: "Halloween",
            emojiSet: ["👻", "🎃", "🕷", "🧟‍♀️", "🍬"],
            numberOfCardPairs: nil,
            color: .orange,
            id: 0),
        Theme (
            name: "Christmas",
            emojiSet: ["🎄", "✝️", "🎅🏼"],
            numberOfCardPairs: 3,
            color: .red,
            id: 1),
        Theme (
            name: "Animals",
            emojiSet: ["🐴", "🐷", "🐶", "🐱", "🐬", "🦁", "🐧"],
            numberOfCardPairs: 7,
            color: .green,
            id: 2),
        Theme (
            name: "Vehicles",
            emojiSet: ["🚗", "🚌", "🚞", "✈️", "🚢"],
            numberOfCardPairs: 5,
            color: .gray,
            id: 3)
    ]
    
    static func getRandomTheme() -> Theme {
        return themes[Int.random(in: 0..<themes.count)]
    }
    
    static func getName(theme: Theme) -> String {
        return theme.name
    }
    
    static func getShuffledEmojis(theme: Theme) -> [String] {
        return theme.emojiSet.shuffled()
    }
    
    static func getNumberOfCardPairs(theme: Theme) -> Int? {
        return theme.numberOfCardPairs
    }
    
    static func getColor(theme: Theme) -> Color {
        return theme.color
    }
}

