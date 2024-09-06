//
//  SubscriptionInfo.swift
//  VirtualPrivateNetworkApp
//
//  Created by Иван Свирский on 10.07.24.
//

import SwiftUI

struct SubscriptionInfo: View {
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, content: {
            
            TabView{
                SubscriptionInfoContent(title: "Spam filter", content: "Protects your smartphone from spam advertising activity")
                SubscriptionInfoContent(title: "Phishing filter", content: "Protects your smartphone stealing your banking and personal data")
                SubscriptionInfoContent(title: "Cryptominers filter", content:"Help to prevent using resourses of your smartphone for mining cryptocurrency")
                SubscriptionInfoContent(title: "Adware filter", content: "Protects your smartphone from a bad site activity")
                SubscriptionInfoContent(title: "Get full protection", content:"Get full access for 9.99$ per WEEK. 3 DAYS Free Trial. Cancel subscription anytime.")
              
            }.tabViewStyle(.page)
                .onAppear {
                    setupAppearance()
                  }
            Spacer().frame(height: 50)
            PaywallButton()
            Spacer().frame(height: 50)
        })
        .frame(width: UIScreen.screenWidth,height: UIScreen.screenHeight * 0.5)
        .background(Color(hex: "F8F8F8"))
        .clipShape(
        .rect(
                topLeadingRadius: 35,
                topTrailingRadius: 35
            )
        ).shadow(color: Color.lightCyan.opacity(0.4), radius: 10)
    }
    
    func setupAppearance() {
      UIPageControl.appearance().currentPageIndicatorTintColor = .black
      UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
    }
}




#Preview {
    SubscriptionInfo()
}

struct SubscriptionInfoContent: View {
    var title: String
    var content: String
    
    var body: some View {
        VStack{
            Text(title).font(.custom("Oxanium", size: 24))    .multilineTextAlignment(.center).foregroundColor(Color.darkCyan)
            Spacer()
                .frame(height: 50)
            Text(content).font(.custom("Montserrat", size: 16)).frame(width: 260)    .multilineTextAlignment(.center).foregroundColor(Color.darkTextGrey)
        }
    }
}
