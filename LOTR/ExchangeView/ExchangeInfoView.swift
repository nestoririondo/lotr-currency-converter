//
//  ExchangeInfoView.swift
//  LOTR
//
//  Created by Néstor on 24.11.25.
//

import SwiftUI

struct ExchangeInfoView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack{
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            VStack{
                Text("Exchange Rates")
                    .font(.largeTitle)
                    .tracking(2)
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                    .padding()
                    .multilineTextAlignment(.center)
                
                ExchangeRateRow(leftImage: .goldpiece, text: "1 Gold Piece = 4 Gold Pennies", rightImage: .goldpenny)
                ExchangeRateRow(leftImage: .goldpenny, text: "1 Golden Piece = 2 Silver Pennies", rightImage: .silverpiece)
                ExchangeRateRow(leftImage: .copperpenny, text: "1 Copper Piece = 1 Copper Penny", rightImage: .copperpenny)
                
                Button("Done"){
                    dismiss()
                }
                    .buttonStyle(.borderedProminent)
                    .tint(.brown.mix(with: .black, by: 0.2))
                    .font(.largeTitle)
                    .padding()
                    .foregroundStyle(.white)
            }
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    ExchangeInfoView()
}


