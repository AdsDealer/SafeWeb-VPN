//
//  HexagonWall.swift
//  VirtualPrivateNetworkApp
//
//  Created by Иван Свирский on 10.07.24.
//

import SwiftUI

struct HexagonWall: View {
    let content: AnyView?
    let shadowColor: Color
    let outerShadowColor: Color
    let innerShadowColor: Color

    init<Content: View>(shadowColor: Color = .gray,
                                outerShadowColor: Color = .black,
                                innerShadowColor: Color = .white,
                        @ViewBuilder content: () -> Content?) {
        self.content = content() != nil ? AnyView(content()!) : nil
        self.shadowColor = shadowColor
        self.outerShadowColor = outerShadowColor
        self.innerShadowColor = innerShadowColor
        
    }

    
    var body: some View {
        ZStack {
//            CentralHexagonItem(isActive: <#Binding<Bool>#>, shadowColor: shadowColor,outerShadowColor:outerShadowColor ,innerShadowColor: innerShadowColor) {
//                content
//                        }.frame(width: 250)
            HexagonItem().frame(width: 250).offset(x: -110,y: 190)
            HexagonItem().frame(width: 250).offset(x: -110,y: -190)
            HexagonItem().frame(width: 250).offset(x: 110,y: -190)
            HexagonItem().frame(width: 250).offset(x:220,y: 0)
            HexagonItem().frame(width: 250).offset(x: 110,y: 190)
            HexagonItem().frame(width: 250).offset(x:-220,y: 0)
        }
    }
}

#Preview {
    HexagonWall{
        
    }
}
