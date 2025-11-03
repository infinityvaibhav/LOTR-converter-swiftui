//
//  ExchangeRate.swift
//  LOTRConverter
//
//  Created by वैभव उपाध्याय on 11/09/25.
//
import SwiftUI

struct ExchangeRate: Identifiable {
    let id = UUID()
    let leftImage: ImageResource
    let exchangeText: String
    let rightImage: ImageResource
    var leftAmount: String = ""
    var rightAmount: String = ""
}

extension ExchangeRate {
    
    static var mock: [ExchangeRate] {
        return [
            ExchangeRate(leftImage: .goldpiece,
                         exchangeText: "1 Gold Piece = 4 Gold Pennies",
                         rightImage: .goldpenny),
            ExchangeRate(leftImage: .goldpenny,
                         exchangeText: "1 Gold Penny = 4 Silver Piece",
                         rightImage: .silverpiece),
            ExchangeRate(leftImage: .silverpiece,
                         exchangeText: "1 Silver Piece = 4 Silver Pennies",
                         rightImage: .silverpenny),
            ExchangeRate(leftImage: .silverpenny,
                         exchangeText: "1 Silver Penny = 100 Copper Pennies",
                         rightImage: .copperpenny)
        ]
    }
}
