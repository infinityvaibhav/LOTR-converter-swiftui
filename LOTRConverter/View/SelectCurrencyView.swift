//
//  SelectCurrencyView.swift
//  LOTRConverter
//
//  Created by वैभव उपाध्याय on 12/09/25.
//
import SwiftUI

struct SelectCurrencyView: View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var leftCurrency: Currency
    @Binding var rightCurrency: Currency
    
    var body: some View {
        ZStack {
            // Parchment Background Image
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack(alignment: .center) {
                // Text
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                
                // Currency icons
                IconGridView(currency: $leftCurrency)
                
                // Text
                Text("Select the currency you would like to:")
                    .fontWeight(.bold)
                    .padding(.top, 20)
                    
                IconGridView(currency: $rightCurrency)
                
                // Done button
                Button("Done") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.2))
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
            }
            .padding()
        }
    }
}

#Preview {
    SelectCurrencyView(leftCurrency: .constant(.copperPenny),
                       rightCurrency: .constant(.goldPenny))
}
