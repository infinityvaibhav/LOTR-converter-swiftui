//
//  CurrencyIconView.swift
//  LOTRConverter
//
//  Created by वैभव उपाध्याय on 13/09/25.
//
import SwiftUI

struct CurrencyIconView: View {
    
    let currecny: Currency
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Currency image
            Image(currecny.image)
                .resizable()
                .scaledToFit()
            
            // Currency name
            Text(currecny.name)
                .padding(3)
                .font(.caption)
                .frame(maxWidth: .infinity)
                .background(.brown.opacity(0.75))
        }
        .padding(3)
        .frame(width: 100, height: 100)
        .background(.brown)
        .clipShape(.rect(cornerRadius: 10))
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CurrencyIconView(currecny: Currency.copperPenny)
}
