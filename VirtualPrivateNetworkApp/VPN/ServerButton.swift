//
//  ServerButton.swift
//  VirtualPrivateNetworkApp
//
//  Created by Иван Свирский on 14.08.24.
//

import SwiftUI

struct ServerButton: View {
    var serverInfo:ServerInfo
    
    var onTap: () -> Void
    
    
    init(action: @escaping () -> Void, server:ServerInfo) {
        onTap = action
        serverInfo = server
    }
    var body: some View {
        Button(action:onTap, label: {
            ZStack{
                RoundedRectangle(cornerRadius: 1)
                    .fill(Color.white.shadow(.inner(color: Color.gray.opacity(0.5), radius: 2, x: 3, y: 3)))
                    .frame(width: .infinity,height: 64)
                HStack {
                    Image(serverInfo.assetName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 48, height: 38)
                        .clipped()
                    Text(serverInfo.serverName)
                        .font(.custom("Oxanium", size: 14))
                        .foregroundColor(Color.greyDarkText)
                    
                    Spacer()
                    
                    Text("IP: \(String(serverInfo.endpoint.split(separator: ":")[0]))")
                        .font(.custom("HelveticaNeue", size: 13))
                        .foregroundColor(Color.gray)
                    
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color.gray)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
            }
        })

       
    }
}


struct SelectServerButton: View {
    
    private var isActive: Bool
    
    var serverInfo:ServerInfo
    
    var onSelect: () -> Void
    var onUnselect: () -> Void

    init(isActive: Bool,selectAction: @escaping () -> Void,unselectAction: @escaping () -> Void, server:ServerInfo) {
        self.isActive = isActive
        onSelect = selectAction
        onUnselect = unselectAction
        serverInfo = server
    }
    
    var body: some View {
        if(isActive){
            SelectedServerButton(action: onSelect, server: serverInfo).onTapGesture {
                onUnselect()
            }
        }else{
            UnselectServerButton(action: onUnselect, server: serverInfo).onTapGesture {
                onSelect()
            }
           
        }
    

    }
}


struct SelectedServerButton: View {
    var serverInfo:ServerInfo
    
    var onTap: () -> Void
    
    
    init(action: @escaping () -> Void, server:ServerInfo) {
        onTap = action
        serverInfo = server
    }
    
    var body: some View {
        
        ZStack{
            RoundedRectangle(cornerRadius: 1)
                .fill(Color.white.shadow(.inner(color: Color.gray.opacity(0.5), radius: 2, x: 3, y: 3)))
                .frame(width: .infinity, height: 64)
            HStack {
                Image(serverInfo.assetName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 48, height: 38)
                    .clipped()
                Text(serverInfo.serverName)
                    .font(.custom("Oxanium", size: 17))
                    .foregroundColor(Color.greyDarkText)
                
                Spacer()
    
                
                Image("checkmarkSymbol")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 28, height: 28)
                    .clipped()
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
        }
    }
}

struct UnselectServerButton: View {
    var serverInfo:ServerInfo
    
    var onTap: () -> Void
    
    
    init(action: @escaping () -> Void, server:ServerInfo) {
        onTap = action
        serverInfo = server
    }
    
    var body: some View {
        
        ZStack{
            HStack {
                Image(serverInfo.assetName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 48, height: 38)
                    .clipped()
                Text(serverInfo.serverName)
                    .font(.custom("Oxanium", size: 17))
                    .foregroundColor(Color.greyDarkText)
                
                Spacer()
    
                
                Image("addSymbol")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 28, height: 28)
                    .clipped()
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
        }.border(Color.greyBorder)
    }
}
