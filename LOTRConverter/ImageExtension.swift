//
//  ImageExtension.swift
//  LOTRConverter
//
//  Created by वैभव उपाध्याय on 11/09/25.
//
import SwiftUI

extension Image {
    func coinStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(height: 33)
    }
}
