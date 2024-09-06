//
//  VirtualPrivateNetworkAppApp.swift
//  VirtualPrivateNetworkApp
//
//  Created by Иван Свирский on 10.07.24.
//

import SwiftUI

@main
struct MainApp: App {
    @State private var showSplash = true
    
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                      if showSplash {
                          SplashScreen()
                      } else {
                          VPNScreen()
                      }
                  }
                  .onAppear {
                      DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                          withAnimation {
                              showSplash = false
                          }
                      }
                  }
        }
    }
}

