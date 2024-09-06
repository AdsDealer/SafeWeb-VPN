//
//  Paywall.swift
//  VirtualPrivateNetworkApp
//
//  Created by Иван Свирский on 10.07.24.
//

import SwiftUI

struct Paywall: ViewControllable {
    var holder: NavStackHolder
    
    var body: some View {
        ZStack(alignment: .top) {
            PayHexagonWall()
                .frame(maxWidth: .infinity, maxHeight: UIScreen.screenHeight - (UIScreen.screenHeight * 0.3), alignment: .top).padding(.bottom,430)
            
            VStack {
                Spacer()
                SubscriptionInfo()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    Paywall(holder: NavStackHolder())
}
