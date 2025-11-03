//
//  ContentView.swift
//  LOTRConverter
//
//  Created by वैभव उपाध्याय on 09/09/25.
//

import SwiftUI
import TipKit

struct ContentView: View {
    
    @State var showExchangeInfo = false
    @State var showSelectCurrency = false
    
    @State var leftAmount = ""
    @State var rightAmont = ""
    
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    @State var leftCurrency: Currency = .silverPiece
    @State var rightCurrency: Currency = .goldPiece
    
    let currencyTip = CurrencyTip()
    
    var body: some View {
        ZStack {
            
            // Background Image
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                // Prancing pony image
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                // Currency exchange text
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                // Conversion section
                HStack {
                    // Left conversion section
                    VStack(spacing: 10) {
                        // curreny
                        HStack {
                            // Currency Image
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            // Currency text
                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .onTapGesture {
                            showSelectCurrency.toggle()
                            currencyTip.invalidate(reason: .actionPerformed)
                        }
                        .popoverTip(currencyTip, arrowEdge: .bottom)
                        
                        // textfield
                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                            .focused($leftTyping)
                            .padding(.horizontal, 16)
                    }
                    .padding(.vertical, 10)
                    
                    // Equal sign
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    
                    // Right conversion section
                    VStack(spacing: 10) {
                        // curreny
                        HStack {
                            // Currency Image
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            // Currency text
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .onTapGesture {
                            showSelectCurrency.toggle()
                            currencyTip.invalidate(reason: .actionPerformed)
                        }
                        
                        // textfield
                        TextField("Amount", text: $rightAmont)
                            .textFieldStyle(.roundedBorder)
                            .focused($rightTyping)
                            .padding(.horizontal, 16)
                    }
                    .padding(.vertical, 10)
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(Capsule())
                .keyboardType(.decimalPad)
                
                Spacer()
                
                // Info Button
                HStack {
                    Spacer()
                    Button {
                        showExchangeInfo.toggle()
                        print(showExchangeInfo)
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                    .padding(.trailing, 20)
                }
            }
        }
        .task {
            try? Tips.configure()
        }
        .onChange(of: leftAmount) {
            if leftTyping {
                rightAmont = leftCurrency
                    .convert(leftAmount,to: rightCurrency)
            }
        }
        .onChange(of: rightCurrency) {
            if rightTyping {
                leftAmount = rightCurrency.convert(rightAmont, to: leftCurrency)
            }
        }
        .onChange(of: leftCurrency) {
            leftAmount = rightCurrency.convert(rightAmont, to: leftCurrency)
        }
        .onChange(of: rightAmont) {
            rightAmont = leftCurrency
                .convert(leftAmount,to: rightCurrency)
        }
        .sheet(isPresented: $showExchangeInfo) {
            ExchangeInfoView()
        }
        .sheet(isPresented: $showSelectCurrency) {
            SelectCurrencyView(leftCurrency: $leftCurrency,
                               rightCurrency: $rightCurrency)
        }
    }
}

#Preview {
    ContentView()
}
