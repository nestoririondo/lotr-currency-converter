//
//  SelectCurrency.swift
//  LOTR
//
//  Created by Néstor on 24.11.25.
//

import SwiftUI

struct IconGrid: View {
    @Binding var selectedCurrency: Currency
    var body: some View {
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]){
                    ForEach(Currency.allCases){ currency in
                        if currency == selectedCurrency {
                            
                            CurrencyIcon(image: currency.image, name: currency.name)
                            
                                .shadow(color: .black, radius: 10)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(lineWidth: 3)
                                        .opacity(0.5)
                                }
                                .onTapGesture {
                                    
                                }
                        } else {
                            CurrencyIcon(image: currency.image, name: currency.name)
                                .onTapGesture {
                                    selectedCurrency = currency
                                    
                                }
                        }
                    }
                }
        }
    }

//#Preview {
//    IconGrid(selectedCurrency: Currency.goldPenny)
//}
