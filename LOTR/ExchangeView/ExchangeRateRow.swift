//
//  ExchangeRateRow.swift
//  LOTR
//
//  Created by Néstor on 24.11.25.
//

import SwiftUI

struct ExchangeRateRow: View {
    let leftImage: ImageResource
    let text: String
    let rightImage: ImageResource
    
    var body: some View {
        HStack{
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)

            Text(text)
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}

#Preview {
    ExchangeRateRow(leftImage: .silverpiece, text: "whatever", rightImage: .copperpenny)
}
