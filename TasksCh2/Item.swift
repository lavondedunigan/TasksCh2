//
//  Item.swift
//  TasksCh2
//
//  Created by Lavonde Dunigan on 2/5/26.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
