//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by Mark Galanti on 7/19/20.
//  Copyright © 2020 Mark Galanti. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil // TODO: bogus
    }
}
