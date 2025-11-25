//
//  converter.swift
//  LOTR
//
//  Created by Néstor on 23.11.25.
//

import SwiftUI

struct Converter: View {
    @Binding var leftCurrency: Currency
    @Binding var rightCurrency: Currency
    @Binding var leftAmount: String
    @Binding var rightAmount: String
    @FocusState private var leftTyping: Bool
    @FocusState private var rightTyping: Bool
    @State var showCurrencySelection: Bool = false
    
    var body: some View {
        HStack{
            //Left
            VStack{
                // Currency
                HStack{
                    // Image
                    Image(leftCurrency.image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 35)
                    // Text
                    Text(leftCurrency.name)
                        .font(.headline)
                        .foregroundStyle(.white)
                }
                
                // Text field(
                TextField("Amount", text: $leftAmount).textFieldStyle(.roundedBorder).multilineTextAlignment(.leading)
                    .focused($leftTyping)
                    .onChange(of: leftAmount) {
                        if leftTyping {
                            rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
                        }
                    }
            }
            
            //Equal
            Image(systemName: "equal")
                .font(.largeTitle)
                .foregroundStyle(.white)
                .symbolEffect(.pulse)
            
            
            //Right
            VStack{
                // Currency
                HStack{
                    // Text
                    Text(rightCurrency.name)
                        .font(.headline)
                        .foregroundStyle(.white)
                    
                    // Image
                    Image(rightCurrency.image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 35)
                }
                
                // Text field
                TextField("Amount", text: $rightAmount).textFieldStyle(.roundedBorder).multilineTextAlignment(.trailing)
                    .focused($rightTyping)
                    .onChange(of: rightAmount) {
                        if rightTyping {
                            leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
                        }
                    }
            }
        }
        .padding()
        .background(.black.opacity(0.5))
        .clipShape(.capsule)
        .onTapGesture {
            showCurrencySelection.toggle()
        }
        .sheet(isPresented: $showCurrencySelection){
            SelectCurrency(selectedStartCurrency: $leftCurrency, selectedTargetCurrency: $rightCurrency)
        }
    }
}

#Preview {
    Converter(
        leftCurrency: .constant(.silverPiece),
        rightCurrency: .constant(.goldPiece),
        leftAmount: .constant("21321"),
        rightAmount: .constant("1232")
    )
}
