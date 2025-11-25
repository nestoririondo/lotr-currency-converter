//
//  ContentView.swift
//  LOTR
//
//  Created by Néstor on 23.11.25.
//

import SwiftUI

struct ContentView: View {
    @State var showExchangeInfo = false
    @State var showCurrencySelection = false
    
    @State var leftAmount = ""
    @State var rightAmount = ""
    
    @State var leftCurrency: Currency = .silverPenny
    @State var rightCurrency: Currency = .goldPenny
    
    var body: some View {
        ZStack {
            // image background
            Image("background")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                // Image
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .onTapGesture {
                        showCurrencySelection.toggle()
                    }
                
                // Text
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                // Conversion
                Converter(
                    leftCurrency: $leftCurrency,
                    rightCurrency: $rightCurrency,
                    leftAmount: $leftAmount,
                    rightAmount: $rightAmount,
                )
                
                Spacer()
                
                // Info button
                HStack {
                    Spacer()
                    Button {
                        showExchangeInfo.toggle()
                        print("clicked \(showExchangeInfo)")
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                    .padding()
                }
            }
        }
        .sheet(isPresented: $showExchangeInfo){
            ExchangeInfoView()
        }
    }
}

struct InfoView: View {
    @Binding var showExchangeInfo: Bool
    var body: some View {
        VStack {
            Text("Currency Exchange Info")
                .font(.largeTitle)
                .padding()
            
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
