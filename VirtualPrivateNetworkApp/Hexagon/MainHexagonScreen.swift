//
//  MainHexagonScreen.swift
//  VirtualPrivateNetworkApp
//
//  Created by Иван Свирский on 13.08.24.
//

import SwiftUI

enum MainHexagonWallAnimationState {
    case base, first, second, third, fourth
}

struct MainHexagonWall: View {

    let onStartVPN: () -> Void
    let onStopVPN: () -> Void
    let content: AnyView?

    
    
    @Binding var isActive:Bool
    @State private var currentState: MainHexagonWallAnimationState = .base
    @State private var isAnimating = false
    @State private var timer: Timer?


    init<Content: View>(isActive: Binding<Bool>,
                        onStartVPN: @escaping () -> Void,
                        onStopVPN: @escaping () -> Void,
                
                        @ViewBuilder content: () -> Content?
                 ) {
        self.content = content() != nil ? AnyView(content()!) : nil

        self._isActive = isActive
        self.onStopVPN = onStopVPN
        self.onStartVPN = onStartVPN

        
    }
    
    private func isActiveForCurrentState(_ state: MainHexagonWallAnimationState) -> Binding<Bool> {
           return Binding(
               get: { self.currentState == state },
               set: { _ in }
           )
       }
    
    var body: some View {
        ZStack {
            ///TOP
            ///
            MainHexagonItem(isActive: isActiveForCurrentState(.first), shadowRadius: 0).frame(width: 175).offset(x: -229,y: -130)
            MainHexagonItem(isActive: isActiveForCurrentState(.second),shadowRadius: 0).frame(width: 175).offset(x: 230,y: -130)
            MainHexagonItem(isActive: isActiveForCurrentState(.third),shadowRadius: 0).frame(width: 175).offset(x: -76,y: -130)
            MainHexagonItem(isActive: isActiveForCurrentState(.fourth),shadowRadius: 0).frame(width: 175).offset(x: 77,y: -130)
            
            
            ///BOTTOM
            MainHexagonItem(isActive: isActiveForCurrentState(.fourth),shadowRadius: 0).frame(width: 175).offset(x: -229,y: 134)
            MainHexagonItem(isActive: isActiveForCurrentState(.third),shadowRadius: 0).frame(width: 175).offset(x: 229.5,y: 134)
            MainHexagonItem(isActive: isActiveForCurrentState(.second),shadowRadius: 0).frame(width: 175).offset(x: -76.5,y: 134)
            MainHexagonItem(isActive: isActiveForCurrentState( .first),shadowRadius: 0).frame(width: 175).offset(x: 76.5,y: 134)
            
            ///MID
            MainHexagonItem(isActive: isActiveForCurrentState( .first),shadowRadius: 0).frame(width: 175).offset(x:153,y: 2)
            MainHexagonItem(isActive: isActiveForCurrentState( .first),shadowRadius: 0).frame(width: 175).offset(x:-153,y: 2)
            
            Button(action:{ if isActive {
                stopAnimation()
                onStopVPN()
            } else {
                startAnimation()
                onStartVPN()
                
            }}){
                CentralHexagonItem(isActive:$isActive,shadowColor: .accentColor,outerShadowColor:.accentColor ,innerShadowColor: .accentColor) {
                    content
                }.frame(width: 175).offset(y: 2)
            }
            
        }
    }
    
    
    

    private func startAnimation() {
        isAnimating = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            withAnimation(.easeInOut(duration: 1)) {
                switch currentState {
                case .first:
                    currentState = .second
                case .second:
                    currentState = .third
                case .third:
                    currentState = .fourth
                case .fourth:
                    currentState = .first
                case .base:
                    currentState = .first

                }
            }
        }
    }
    
    private func stopAnimation() {
        isAnimating = false
        timer?.invalidate()
        timer = nil
        currentState = .base
    }
}




//struct AContentView: View {
//    enum AnimationState {
//        case first, second, third, fourth
//    }
//    
//    @State private var currentState: AnimationState = .first
//    @State private var isAnimating = false
//    @State private var timer: Timer?
//    
//    var body: some View {
//        VStack {
//            // Пример анимации: изменение цвета и размера квадрата в зависимости от текущего состояния
//            Rectangle()
//                .fill(color(for: currentState))
//                .frame(width: size(for: currentState), height: size(for: currentState))
//                .onAppear {
//                    startAnimation()
//                }
//                .transition(.scale)
//            
//            // Кнопка для запуска и остановки анимации
//            Button(action: {
//                if isAnimating {
//                    stopAnimation()
//                } else {
//                    startAnimation()
//                }
//            }) {
//                Text(isAnimating ? "Stop Animation" : "Start Animation")
//                    .padding()
//                    .background(Color.blue)
//                    .foregroundColor(.white)
//                    .cornerRadius(10)
//            }
//        }
//    }
//    
//    private func color(for state: AnimationState) -> Color {
//        switch state {
//        case .first:
//            return .red
//        case .second:
//            return .green
//        case .third:
//            return .blue
//        case .fourth:
//            return .yellow
//        }
//    }
//    
//    private func size(for state: AnimationState) -> CGFloat {
//        switch state {
//        case .first, .third:
//            return 100
//        case .second, .fourth:
//            return 150
//        }
//    }
//    
//    private func startAnimation() {
//        isAnimating = true
//        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
//            withAnimation(.easeInOut(duration: 1)) {
//                switch currentState {
//                case .first:
//                    currentState = .second
//                case .second:
//                    currentState = .third
//                case .third:
//                    currentState = .fourth
//                case .fourth:
//                    currentState = .first
//                }
//            }
//        }
//    }
//    
//    private func stopAnimation() {
//        isAnimating = false
//        timer?.invalidate()
//        timer = nil
//    }
//}
//#Preview {
//    AContentView()
//}
