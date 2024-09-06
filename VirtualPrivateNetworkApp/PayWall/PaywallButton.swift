//
//  PaywallButton.swift
//  VirtualPrivateNetworkApp
//
//  Created by Иван Свирский on 10.07.24.
//

import SwiftUI

struct PaywallButton: View {
    var body: some View {
        Button(action: {}) {
            Text("Continue")
                .frame(width: 300, height: 60)
                .background(Color(hex: "10CFCF"))
                .foregroundColor(.white)
                .cornerRadius(10)
                .overlay(
                    Rectangle()
                        .stroke(Color.black.opacity(0.1), lineWidth: 2)
                        .shadow(color: Color.black, radius: 4)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                )
        }
        .padding(.horizontal, 80)
        
    }
}

#Preview {
    PaywallButton()
}
