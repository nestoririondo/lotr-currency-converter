//
//  Currency.swift
//  LOTR
//
//  Created by Néstor on 24.11.25.
//

import SwiftUI

enum Currency: Double, CaseIterable, Identifiable {
    case copperPenny = 6400
    case silverPenny = 64
    case goldPenny = 4
    case silverPiece = 16
    case goldPiece = 1
    
    var id: Currency { self }
    
    var image: ImageResource {
        switch self {
        case .copperPenny: return .copperpenny
        case .silverPenny: return .silverpenny
        case .goldPenny: return .goldpenny
        case .silverPiece: return .silverpiece
        case .goldPiece: return .goldpiece
        }
    }
    
    var name: String {
        switch self {
        case .copperPenny: return "Copper Penny"
        case .silverPenny: return "Silver Penny"
        case .goldPenny: return "Gold Penny"
        case .silverPiece: return "Silver Piece"
        case .goldPiece: return "Gold Piece"
        }
    }
    
    func convert(_ amountString: String, to currency: Currency) -> String {
        guard let amountDouble = Double(amountString) else {
            return ""
        }
        let convertedAmount = (amountDouble / self.rawValue) * currency.rawValue
        return String(format: "%.2f", convertedAmount)
    }
}
