//
//  PayWallHexagonWall.swift
//  VirtualPrivateNetworkApp
//
//  Created by Иван Свирский on 01.08.24.
//

import SwiftUI

struct PayHexagonWall: View {
    var body: some View {
        ZStack(content: {
            HexagonWall(shadowColor: Color.cyan,outerShadowColor: Color.cyan,innerShadowColor: Color.cyan){
                TabView{
                    Image("spam")
                        .resizable()
                                   .aspectRatio(contentMode: .fit)
                                   .frame(width: 170, height: 170)
                                   .clipped()
                    Image("phishing")
                        .resizable()
                                   .aspectRatio(contentMode: .fit)
                                   .frame(width: 170, height: 170)
                                   .clipped()
                    Image("bit")
                        .resizable()
                                   .aspectRatio(contentMode: .fit)
                                   .frame(width: 170, height: 170)
                                   .clipped()
                    Image("ad")
                        .resizable()
                                   .aspectRatio(contentMode: .fit)
                                   .frame(width: 170, height: 170)
                                   .clipped()
                    Image("shield")
                        .resizable()
                                   .aspectRatio(contentMode: .fit)
                                   .frame(width: 170, height: 170)
                                   .clipped()
                }.tabViewStyle(.page)
            }
    
        
        })
    }
}

#Preview {
    PayHexagonWall()
}
