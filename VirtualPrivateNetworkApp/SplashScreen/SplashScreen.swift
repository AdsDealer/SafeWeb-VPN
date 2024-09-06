//
//  SplashScreen.swift
//  VirtualPrivateNetworkApp
//
//  Created by Иван Свирский on 15.08.24.
//

import SwiftUI
import Shimmer

struct SplashScreen: View {
    var body: some View {
        ZStack{
            Color.greyMain
                .edgesIgnoringSafeArea(.all)
            Text("Safe Web VPN")
                .font(.custom("SpaceArmor", size: 34))
                .foregroundColor(Color.darkCyan)
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
                .shimmering()
        }
    }
}

#Preview {
    SplashScreen()
}
