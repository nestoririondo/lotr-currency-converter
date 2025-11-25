//
//  Currency.swift
//  LOTR
//
//  Created by Néstor on 24.11.25.
//

import SwiftUI

struct CurrencyIcon: View {
    let image: ImageResource
    let name: String
    
    var body: some View {
        ZStack(alignment: .bottom){
            Image(image)
                .resizable()
                .scaledToFit()
            Text(name)
                .padding(3)
                .font(.caption)
                .frame(maxWidth: .infinity)
                .background(.brown.opacity(0.75))
        }
        .padding(3)
        .frame(width: 100, height: 100)
        .background(.brown.opacity(0.5))
        .clipShape(.rect(cornerRadius: 25))
    }
}

#Preview {
    CurrencyIcon(image: .goldpenny, name: "Gold Penny")
}
