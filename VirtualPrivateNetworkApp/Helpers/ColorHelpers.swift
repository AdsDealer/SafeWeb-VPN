//
//  ColorHelpers.swift
//  VirtualPrivateNetworkApp
//
//  Created by Иван Свирский on 01.08.24.
//

import Foundation
import SwiftUI



extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}


//F8F8F8
//C1C1C1
extension Color {
    static let greyMain = Color(hex: "#F6F6F6")
    static let greyBorder = Color(hex: "#B0B0B0")
    static let greyDot = Color(hex: "#2ecc71")
    static let greyDivider = Color(hex: "#C1C1C1")
    static let darkCyan = Color(hex: "#10CFCF")
    static let lightCyan = Color(hex: "#10D7D7")
    static let textGrey = Color(hex: "#DCDCDC")
    static let greyDarkText = Color(hex: "#898989")
    static let greyLightText = Color(hex: "#DCDCDC")
    static let darkTextGrey = Color(hex: "#A4A4A4")

}
