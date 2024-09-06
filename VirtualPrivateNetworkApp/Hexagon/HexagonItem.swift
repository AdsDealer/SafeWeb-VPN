//
//  HexagonElement.swift
//  VirtualPrivateNetworkApp
//
//  Created by Иван Свирский on 10.07.24.
//

import SwiftUI


struct Content<Content> where Content : View {
    func body(content: Content) -> some View {
        return content
    }
}

//struct HexagonItem: View {
//    var xShadowOffset: CGFloat?
//    var yShadowOffset: CGFloat?
//    var shadowRadius: CGFloat?
//
//    var body: some View {
//        GeometryReader { geometry in
//            Hexagon()
//                          .rotation(Angle(degrees: 30))
//                          .fill(Color.greyMain).shadow(radius: shadowRadius ?? 10,x:xShadowOffset ?? 0 ,y:yShadowOffset ?? 0 )
//                          .overlay(
//                              Hexagon().rotation(Angle(degrees: 30))
//                                  .stroke(Color(hex: "F8F8F8"), lineWidth: 1)
//                            
//                                  .shadow(color: .black.opacity(0.5), radius: 5, x: 5, y: 5) // Внешняя тень
//                                  .clipShape(
//                                      Hexagon()
//                                          .rotation(Angle(degrees: 30)) // Повторное вращение для совпадения форм
//                                          .offset(x: 0, y: 5) // Смещаем маску вниз для внешней тени в нижней части
//                                  )
//                          ) .overlay(
//                            Hexagon().rotation(Angle(degrees: 30))
//                                .stroke(Color(hex: "F8F8F8"), lineWidth: 1)
//                                .shadow(color: .white.opacity(0.7), radius: 3, x: -3, y: -3) // Внутренняя тень
//                                .clipShape(
//                                    Hexagon()
//                                         // Повторное вращение для совпадения форм
//                                        .offset(x: 0, y: -5).rotation(Angle(degrees: 30)) // Смещаем маску вверх для внутренней тени в верхней части
//                                )
//                        )
//                          
//        }
//        .aspectRatio(1, contentMode: .fit)
//    }
//    
//
//}

struct HexagonItem: View {
    var xShadowOffset: CGFloat?
    var yShadowOffset: CGFloat?
    var shadowRadius: CGFloat?

    var body: some View {
        GeometryReader { geometry in
            Hexagon()
                          .rotation(Angle(degrees: 30))
                          .fill(Color.greyMain).shadow(radius: shadowRadius ?? 10,x:xShadowOffset ?? 0 ,y:yShadowOffset ?? 0 )
                    
                          
        }
        .aspectRatio(1, contentMode: .fit)
    }
    

}

struct MainHexagonItem: View {
    var xShadowOffset: CGFloat?
    var yShadowOffset: CGFloat?
    var shadowRadius: CGFloat?
    
    
    @Binding private var isActive : Bool
    
    init(isActive: Binding<Bool>, xShadowOffset: CGFloat? = nil, yShadowOffset: CGFloat? = nil, shadowRadius: CGFloat? = nil) {
        _isActive = isActive
        self.xShadowOffset = xShadowOffset
        self.yShadowOffset = yShadowOffset
        self.shadowRadius = shadowRadius
    }
    
    
    var body: some View {
        if(!isActive) { GeometryReader { geometry in
            Hexagon()
                .rotation(Angle(degrees: 30))
                .fill(Color.greyMain).shadow(radius: shadowRadius ?? 10,x:xShadowOffset ?? 0 ,y:yShadowOffset ?? 0 )
            
            
        }
            .aspectRatio(1, contentMode: .fit)
        }  else {
            GeometryReader { geometry in
                Hexagon()
                    .rotation(Angle(degrees: 30))
                    .fill(Color.greyMain)
                    .overlay(
                        Hexagon().rotation(Angle(degrees: 30))
                            .stroke(Color(hex: "F8F8F8"), lineWidth: 1)
                        
                            .shadow(color: .black, radius: 2, x: 5, y: 5) // Внешняя тень
                            .clipShape(
                                Hexagon()
                                    .rotation(Angle(degrees: 30))
                                    .offset(x: 0, y: 5)
                            )
                            .clipShape(
                                Hexagon()
                                    .rotation(Angle(degrees: 30))
                                    .offset(x: 0, y: 0)
                            )
                    )
                    .overlay(
                        Hexagon().rotation(Angle(degrees: 30))
                            .stroke(Color(hex: "F8F8F8"), lineWidth: 1)
                            .shadow(color: .black, radius: 2, x: -3, y: -3) // Внутренняя тень
                            .clipShape(
                                Hexagon()
                                // Повторное вращение для совпадения форм
                                    .offset(x: 0, y: -5).rotation(Angle(degrees: 30)) // Смещаем маску вверх для внутренней тени в верхней части
                            ).clipShape(
                                Hexagon()
                                    .rotation(Angle(degrees: 30))
                                    .offset(x: 0, y: 0)
                            )
                    )
                
            }
            .aspectRatio(1, contentMode: .fit)
        }
    }
    

}


struct CentralHexagonItem: View {
    let content: AnyView?
    let shadowColor: Color
    let outerShadowColor: Color
    let innerShadowColor: Color
    var shadowRadius: CGFloat?
    
    @Binding private var isActive : Bool


    init<Content: View>(isActive: Binding<Bool>,
                        shadowColor: Color = .gray,
                                outerShadowColor: Color = .red,
                                innerShadowColor: Color = .red,
                        @ViewBuilder content: () -> Content?) {
        self.content = content() != nil ? AnyView(content()!) : nil
        self.shadowColor = shadowColor
        self.outerShadowColor = outerShadowColor
        self.innerShadowColor = innerShadowColor
        _isActive = isActive
        
    }

    var body: some View {
        ZStack {
        GeometryReader { geometry in
        
                
                Hexagon()
                    .rotation(Angle(degrees: 30))
                    .fill(Color(hex: "F8F8F8"))
                    .shadow(color: isActive ? .darkCyan : .clear,radius: 4)
            
            if(isActive){
//                Hexagon()
//                    .rotation(Angle(degrees: 30))
//                    .stroke(Color(hex: "F8F8F8"), lineWidth: 1)
//                    .shadow(color: innerShadowColor.opacity(0.7), radius: 3)
//                    .clipShape(
//                        Hexagon()
//                            .rotation(Angle(degrees: 30))
//                            .offset(x: 0, y: -5)
//                    )
                
//                Hexagon()
//                    .rotation(Angle(degrees: 30))
//                    .stroke(Color(hex: "F8F8F8"), lineWidth: 1)
//                    .shadow(color: outerShadowColor.opacity(1), radius: 5, x: 5, y: 5)
//                    .clipShape(
//                        Hexagon()
//                            .rotation(Angle(degrees: 30))
//                            .offset(x: 0, y: 5)
//                    )
            }
    
           
            }
            .aspectRatio(1, contentMode: .fit)
            if let content = content {
                content
            }
        }
        
    }
}


struct Hexagon: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.size.height, rect.size.width) / 2
        let corners = corners(center: center, radius: radius)
        path.move(to: corners[0])
        corners[1...5].forEach() { point in
            path.addLine(to: point)
        }
        path.closeSubpath()
        return path
    }

    func corners(center: CGPoint, radius: CGFloat) -> [CGPoint] {
        var points: [CGPoint] = []
        for i in (0...5) {
          let angle = CGFloat.pi / 3 * CGFloat(i)
          let point = CGPoint(
            x: center.x + radius * cos(angle),
            y: center.y + radius * sin(angle)
          )
          points.append(point)
        }
        return points
    }
}

