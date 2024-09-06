//
//  SelectServerScreen.swift
//  VirtualPrivateNetworkApp
//
//  Created by Иван Свирский on 14.08.24.
//

import SwiftUI




struct SelectServerScreen: View {
    
    @Binding var selectedServer: ServerInfo
    var servers: [ServerInfo]
    
    var body: some View {
        ZStack {
            VStack {
                // Заголовок для быстрого сервера
                HStack {
                    Spacer()
                    Text("Fastest Server")
                        .font(.custom("Montserrat", size: 14))
                        .fontWeight(.regular)
                        .foregroundColor(.gray)
                }
                
                // Кнопка для быстрого сервера
                SelectServerButton(
                    isActive: true,
                    selectAction: {},
                    unselectAction: {},
                    server: selectedServer
                )
                
                Spacer().frame(height: 20)
                
                // Заголовок для остальных серверов
                HStack {
                    Spacer()
                    Text("Other servers")
                        .font(.custom("Montserrat", size: 14))
                        .fontWeight(.regular)
                        .foregroundColor(.gray)
                }
                
                // Список серверов
                ScrollView {
                    ForEach(servers) { server in
                        SelectServerButton(
                            isActive: selectedServer.endpoint == server.endpoint,
                            selectAction: {
                                selectedServer = server
                            },
                            unselectAction: {},
                            server: server
                        )
                        .padding(.bottom, 20)
                    }
                }
            }
        }
        .padding()
        .onChange(of: selectedServer) { oldValue, newValue in
                print("Selected server changed from: \(oldValue.serverName) to \(newValue.serverName)")
                // Дополнительные действия при изменении selectedServer
            }
    }
}
