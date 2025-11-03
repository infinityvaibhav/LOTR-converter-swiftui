//
//  ExchangeRateView.swift
//  LOTRConverter
//
//  Created by वैभव उपाध्याय on 11/09/25.
//
import SwiftUI

struct ExchangeRateView: View {
    
    let exchnageRate: ExchangeRate
    
    var body: some View {
        HStack {
            // Left currency image
            Image(exchnageRate.leftImage)
                .coinStyle()
            // Exchange rate text
            Text(exchnageRate.exchangeText)
            
            // Right currency image
            Image(exchnageRate.rightImage)
                .coinStyle()
        }
    }
}

#Preview {
    ExchangeRateView(exchnageRate: ExchangeRate.mock[0])
}
