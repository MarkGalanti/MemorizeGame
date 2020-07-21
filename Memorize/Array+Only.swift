//
//  Array+Only.swift
//  Memorize
//
//  Created by Mark Galanti on 7/19/20.
//  Copyright © 2020 Mark Galanti. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
