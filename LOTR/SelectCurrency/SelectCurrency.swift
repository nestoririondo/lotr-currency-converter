//
//  SelectCurrency.swift
//  LOTR
//
//  Created by Néstor on 24.11.25.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    @Binding var selectedStartCurrency: Currency
    @Binding var selectedTargetCurrency: Currency
    
    var body: some View {
        ZStack{
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
                
            VStack(spacing: 20){
                Text("Select starting currency")
                
                IconGrid(selectedCurrency: $selectedStartCurrency)
                Text("Select currency you want to convert to")
                
                IconGrid(selectedCurrency: $selectedTargetCurrency)
                
                
                Button("Done"){
                    dismiss()
                }
                    .buttonStyle(.borderedProminent)
                    .tint(.brown.mix(with: .black, by: 0.2))
                    .font(.largeTitle)
                    .padding()
                    .foregroundStyle(.white)
            }
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    @Previewable @State var topCurrency: Currency = .copperPenny
    @Previewable @State var bottomCurrency: Currency = .goldPiece
    
    SelectCurrency(selectedStartCurrency: $topCurrency, selectedTargetCurrency: $bottomCurrency)
}
