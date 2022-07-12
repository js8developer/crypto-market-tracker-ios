//
//  SortTag.swift
//  crypto-market-tracker-ios
//
//  Created by Jason Schneider on 7/12/22.
//

import Foundation

struct SortTag: Identifiable {
    var id = UUID()
    var index: Int
    var text: String
}
