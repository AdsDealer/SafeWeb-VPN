//
//  InfoScreen.swift
//  VirtualPrivateNetworkApp
//
//  Created by Иван Свирский on 05.09.24.
//

import SwiftUI

struct InfoScreen: View {
    var title: String
    var bodyText: String

    var body: some View {
        ZStack {
            Color.greyMain
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text(title)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top)
                        .foregroundColor(.black) // Устанавливаем цвет текста заголовка на черный

                    Text(bodyText)
                        .font(.body)
                        .lineSpacing(8)
                        .padding()
                        .foregroundColor(.black) // Устанавливаем цвет текста основного текста на черный
                    
                    Spacer()
                }
          
            }
        }
    }
}

#Preview {
    InfoScreen(title: InfoTextResources.privacyPolicyTitle, bodyText: InfoTextResources.privacyPolicyBody)
}
