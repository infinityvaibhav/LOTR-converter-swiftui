//
//  CurrencyTip.swift
//  LOTRConverter
//
//  Created by वैभव उपाध्याय on 12/10/25.
//
import TipKit

struct CurrencyTip: Tip {
    var title = Text("Change Currency")
    
    var message: Text? = Text("You can tap the left or right currency to bring up the select Currency Screen.")
    
    var image: Image? = Image(systemName: "hand.tap.fill")
}
