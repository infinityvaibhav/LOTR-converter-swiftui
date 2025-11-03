//
//  IconGridView.swift
//  LOTRConverter
//
//  Created by वैभव उपाध्याय on 13/09/25.
//
import SwiftUI

struct IconGridView: View {
    
    private let columns = [GridItem(), GridItem(), GridItem()]
    @Binding var currency: Currency
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(Currency.allCases) { currency in
                if self.currency == currency {
                    // Currency icons
                    CurrencyIconView(currecny: currency)
                        .shadow(color: .black, radius: 10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(lineWidth: 3)
                        }
                } else {
                    CurrencyIconView(currecny: currency)
                        .onTapGesture {
                            self.currency = currency
                        }
                }
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    IconGridView(currency: .constant(.copperPenny))
}
