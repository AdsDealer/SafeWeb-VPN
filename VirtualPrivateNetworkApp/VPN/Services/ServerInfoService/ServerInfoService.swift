//
//  ServerInfoService.swift
//  VirtualPrivateNetworkApp
//
//  Created by Иван Свирский on 02.09.24.
//

import Foundation


class ServerInfoService{
    
    private var rawServers: [String]=["""
[Interface]
PrivateKey = MDUwdS9t1aHzqPPAfLKMoj6avHEW7h/fwm1tFFpTHkM=
Address = 10.10.10.2/32
DNS = 1.1.1.1

[Peer]
PublicKey = S51ZHd9B6pMcZpxhDeoeHM9KCpuZ1ho+lzuglgpqblg=
AllowedIPs = 0.0.0.0/0, ::/0
Endpoint = 159.89.121.122:51820
""","""
[Interface]
PrivateKey = EF+QYPj/nq1ICYtq2A0DBPNJZKNvelQn37yi8TwzYlI=
Address = 10.10.10.2/32
DNS = 1.1.1.1

[Peer]
PublicKey = 7WdLtjgQDm58guOoQNCc5v+MGK4ky1mknjws6prdtjI=
AllowedIPs = 0.0.0.0/0, ::/0
Endpoint = 142.93.213.98:51820
""","""
[Interface]
PrivateKey = CIyri8zJW5KE4N6aUmXx/kriLebinCyIFZD0bCEceXc=
Address = 10.10.10.2/32
DNS = 1.1.1.1

[Peer]
PublicKey = yRZoNsXTgbZCIFzgNCNj09q6KOAJ276AGDxQHFi5tF8=
AllowedIPs = 0.0.0.0/0, ::/0
Endpoint = 134.122.108.237:51820
""","""
[Interface]
PrivateKey = SMK4RtgVH6CGBbleRiS5RbJaoWbdCuiqTS1EpgBD40s=
Address = 10.10.10.2/32
DNS = 1.1.1.1

[Peer]
PublicKey = 9MrfNlkF8NXvrtmlK+zJn9R+KKQkyopWok/DpttCuwc=
AllowedIPs = 0.0.0.0/0, ::/0
Endpoint = 146.190.80.5:51820
""","""
[Interface]
PrivateKey = iGDDPUqrYrd16kTUjW2ke9ybkYfC8skoiVaPioUBNGs=
Address = 10.10.10.2/32
DNS = 1.1.1.1

[Peer]
PublicKey = qnr3kAj1jmZpiQfaukJY8NHRPhNuZctWohTFy6zcOyg=
AllowedIPs = 0.0.0.0/0, ::/0
Endpoint = 170.64.177.188:51820
""","""
[Interface]
PrivateKey = 2KOYRTQiAQ7EtNfOkUFmaYEzgEBitArTL9hkJOleKEM=
Address = 10.8.0.2/32
DNS = 1.1.1.1

[Peer]
PublicKey = LQP5LNWRHxoVic+qcP3VTJ4qmXT0cZHsNzMJKLRKNy8=
AllowedIPs = 0.0.0.0/0, ::/0
Endpoint = 142.93.111.207:51820
"""]
    
    
    var serversInfo: [ServerInfo]{
        get{
            return [
                ServerInfo(privateKey: "2KOYRTQiAQ7EtNfOkUFmaYEzgEBitArTL9hkJOleKEM=", address: "10.8.0.2/32", dns: "1.1.1.1", publicKey: "LQP5LNWRHxoVic+qcP3VTJ4qmXT0cZHsNzMJKLRKNy8=", allowedIp: "0.0.0.0/0, ::/0", endpoint:"142.93.111.207:51820", serverName: "Frankfurt - Germany", assetName: "de", 
                           fullConfig: """
[Interface]
PrivateKey = 2KOYRTQiAQ7EtNfOkUFmaYEzgEBitArTL9hkJOleKEM=
Address = 10.8.0.2/32
DNS = 1.1.1.1

[Peer]
PublicKey = LQP5LNWRHxoVic+qcP3VTJ4qmXT0cZHsNzMJKLRKNy8=
AllowedIPs = 0.0.0.0/0, ::/0
Endpoint = 142.93.111.207:51820
"""),
                
                ServerInfo(privateKey: "EF+QYPj/nq1ICYtq2A0DBPNJZKNvelQn37yi8TwzYlI=", address: "10.10.10.2/32", dns: "1.1.1.1", publicKey: "7WdLtjgQDm58guOoQNCc5v+MGK4ky1mknjws6prdtjI=", allowedIp: "0.0.0.0/0, ::/0", endpoint: "142.93.213.98:51820", serverName: "Bangalore - India", assetName: "in", fullConfig: """
[Interface]
PrivateKey = EF+QYPj/nq1ICYtq2A0DBPNJZKNvelQn37yi8TwzYlI=
Address = 10.10.10.2/32
DNS = 1.1.1.1

[Peer]
PublicKey = 7WdLtjgQDm58guOoQNCc5v+MGK4ky1mknjws6prdtjI=
AllowedIPs = 0.0.0.0/0, ::/0
Endpoint = 142.93.213.98:51820
"""),
                
                ServerInfo(privateKey: "CIyri8zJW5KE4N6aUmXx/kriLebinCyIFZD0bCEceXc=", address: "10.10.10.2/32", dns: "1.1.1.1", publicKey: "yRZoNsXTgbZCIFzgNCNj09q6KOAJ276AGDxQHFi5tF8=", allowedIp: "0.0.0.0/0, ::/0", endpoint: "134.122.108.237:51820", serverName: "London - England", assetName: "uk", fullConfig: """
[Interface]
PrivateKey = CIyri8zJW5KE4N6aUmXx/kriLebinCyIFZD0bCEceXc=
Address = 10.10.10.2/32
DNS = 1.1.1.1

[Peer]
PublicKey = yRZoNsXTgbZCIFzgNCNj09q6KOAJ276AGDxQHFi5tF8=
AllowedIPs = 0.0.0.0/0, ::/0
Endpoint = 134.122.108.237:51820
"""),
                
                ServerInfo(privateKey: "SMK4RtgVH6CGBbleRiS5RbJaoWbdCuiqTS1EpgBD40s=", address: "10.10.10.2/32", dns: "1.1.1.1", publicKey: "9MrfNlkF8NXvrtmlK+zJn9R+KKQkyopWok/DpttCuwc=", allowedIp: "0.0.0.0/0, ::/0", endpoint: "146.190.80.5:51820", serverName: "Singapore - Singapore", assetName: "sg", fullConfig: """
[Interface]
PrivateKey = SMK4RtgVH6CGBbleRiS5RbJaoWbdCuiqTS1EpgBD40s=
Address = 10.10.10.2/32
DNS = 1.1.1.1

[Peer]
PublicKey = 9MrfNlkF8NXvrtmlK+zJn9R+KKQkyopWok/DpttCuwc=
AllowedIPs = 0.0.0.0/0, ::/0
Endpoint = 146.190.80.5:51820
"""),
                ServerInfo(privateKey: "iGDDPUqrYrd16kTUjW2ke9ybkYfC8skoiVaPioUBNGs=", address: "10.10.10.2/32", dns: "1.1.1.1", publicKey: "qnr3kAj1jmZpiQfaukJY8NHRPhNuZctWohTFy6zcOyg=", allowedIp: "0.0.0.0/0, ::/0", endpoint: "170.64.177.188:51820", serverName: "Sydney - Australia", assetName: "au", fullConfig: """
[Interface]
PrivateKey = iGDDPUqrYrd16kTUjW2ke9ybkYfC8skoiVaPioUBNGs=
Address = 10.10.10.2/32
DNS = 1.1.1.1

[Peer]
PublicKey = qnr3kAj1jmZpiQfaukJY8NHRPhNuZctWohTFy6zcOyg=
AllowedIPs = 0.0.0.0/0, ::/0
Endpoint = 170.64.177.188:51820
"""),
                ServerInfo(privateKey: "MDUwdS9t1aHzqPPAfLKMoj6avHEW7h/fwm1tFFpTHkM=", address: "10.10.10.2/32", dns: "1.1.1.1", publicKey: "S51ZHd9B6pMcZpxhDeoeHM9KCpuZ1ho+lzuglgpqblg=", allowedIp: "0.0.0.0/0, ::/0", endpoint: "159.89.121.122:51820", serverName: "Toronto - Canada", assetName: "ca", fullConfig: """
[Interface]
PrivateKey = MDUwdS9t1aHzqPPAfLKMoj6avHEW7h/fwm1tFFpTHkM=
Address = 10.10.10.2/32
DNS = 1.1.1.1

[Peer]
PublicKey = S51ZHd9B6pMcZpxhDeoeHM9KCpuZ1ho+lzuglgpqblg=
AllowedIPs = 0.0.0.0/0, ::/0
Endpoint = 159.89.121.122:51820
"""),]
        }
    }
    
    
    var firstServer:ServerInfo{
        get{
            return serversInfo.first!
        }
    }
}



struct ServerInfo:Decodable,Identifiable,Equatable{
    let id = UUID()
    
    public let privateKey: String
    public let address: String
    public let dns: String
    public let publicKey: String
    public let allowedIp: String
    public let endpoint: String
    public let serverName: String
    public let assetName:String
    public let fullConfig:String
}
