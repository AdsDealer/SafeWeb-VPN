import SwiftUI
import NetworkExtension


struct VPNScreen: View {
    @StateObject private var connectionView = ConnectionViewModel()
    @State private var presentSideMenu:Bool = false
    @State private var showingCredits:Bool = false
    @State private var selectedServer: ServerInfo
    private var serverInfoService : ServerInfoService! = ServerInfoService()
    
    

    init(presentSideMenu: Bool = false) {
        self._selectedServer = State(initialValue: serverInfoService.firstServer)
        self.presentSideMenu = presentSideMenu
    }
    
    
    
    var isActiveBinding: Binding<Bool> {
           Binding(
               get: { connectionView.vpnStatus != .disconnected },
               set: { newValue in
                   if newValue {
                       connectionView.vpnStatus = .disconnected
                   } else {
                       connectionView.vpnStatus = .connected // Set to whatever other state makes sense
                   }
               }
           )
       }
    
    
    func getConnectionString(vpnStatus:NEVPNStatus) -> String{
        switch vpnStatus{
            
        case .invalid:
            return "INVALID"
        case .disconnected:
            return "DISCONNECTED"
        case .connecting:
            return "CONNECTING..."
        case .connected:
            return "CONNECTED"
        case .reasserting:
            return "DISCONNECTED"
        case .disconnecting:
            return "DISCONNECTING..."
        @unknown default:
            return "DISCONNECTED"
        }
    }
    
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                Color.greyMain
                    .edgesIgnoringSafeArea(.all)
           
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)){
                 
                    VStack {
                        Text(formatSecondsToTime(Int(connectionView.connectionTime)))
                            .font(.custom("Oxanium", size: 26))
                            .foregroundColor(Color.darkCyan)
                            .frame(maxWidth: .infinity, alignment: .top)
                            .padding(.top, 20)
                        Text(getConnectionString(vpnStatus: connectionView.vpnStatus))
                            .font(.custom("Oxanium", size: 26))
                            .foregroundColor(Color.greyLightText)
                            .frame(maxWidth: .infinity, alignment: .top)
                            .padding(.top, 10)
                        
                        Spacer()
                    }
                    
                    Image("menu")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 32, height: 32)
                        .clipped()
                        .padding().onTapGesture {
                            presentSideMenu.toggle()
                        }
                }
                
                MainHexagonWall(isActive: isActiveBinding, onStartVPN: {
                    connectionView.connect(server: selectedServer)
                }, onStopVPN: {
                    connectionView.disconnect()
                }){
                    Image("activeButton")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .clipped()
                }.padding(.bottom,70)
                
               
            
                VStack {
                    Spacer()
                    
                    
                    ServerButton(action: {
                        showingCredits.toggle()
                    }, server: selectedServer).padding().sheet(isPresented: $showingCredits) {
                        SelectServerScreen(selectedServer: $selectedServer, servers: serverInfoService.serversInfo)
                    }
                    Spacer().frame(height: 80)
                    
                    
//                    HStack(spacing: 50) {
//                        VStack {
//                            HStack {
//                                Image(systemName: "arrow.down.circle")
//                                    .font(.system(size: 20))
//                                    .foregroundColor(Color.gray)
//                                
//                                Text("Download")
//                                    .font(.custom("Montserrat", size: 18))
//                                    .foregroundColor(Color.gray)
//                            }
//                            
//                            HStack(alignment: .lastTextBaseline, spacing: 0) {
//                                Text("0.0")
//                                    .font(.custom("Montserrat", size: 24))
//                                    .foregroundColor(Color.gray)
//                                
//                                Text(" kb/s")
//                                    .font(.custom("Montserrat", size: 18))
//                                    .foregroundColor(Color.gray)
//                                    .padding(.leading, 2)
//                            }
//                        }
//                    
//                        VStack {
//                            HStack {
//                                Image(systemName: "arrow.up.circle")
//                                    .font(.system(size: 20))
//                                    .foregroundColor(Color.gray)
//                                
//                                Text("Upload")
//                                    .font(.custom("Montserrat", size: 18))
//                                    .foregroundColor(Color.gray)
//                            }
//                            
//                            HStack(alignment: .lastTextBaseline, spacing: 0) {
//                                Text("0.0")
//                                    .font(.custom("Montserrat", size: 24))
//                                    .foregroundColor(Color.gray)
//                                
//                                Text(" kb/s")
//                                    .font(.custom("Montserrat", size: 18))
//                                    .foregroundColor(Color.gray)
//                                    .padding(.leading, 2)
//                            }
//                        }
//                    }
//                    .padding()
//                    .frame(maxWidth: .infinity, alignment: .center)
      
                
                    
                }
                SideMenu(isShowing: $presentSideMenu, content: AnyView(SideMenuView( presentSideMenu: $presentSideMenu)))

            }.onChange(of: selectedServer) { oldValue, newValue in
                //TODO: add disconnect action
                    // Дополнительные действия при изменении selectedServer
                }
        }
    }
    
    func formatSecondsToTime(_ seconds: Int) -> String {
        let hours = seconds / 3600
        let minutes = (seconds % 3600) / 60
        let secs = seconds % 60
        
        return String(format: "%02d:%02d:%02d", hours, minutes, secs)
    }
}

#Preview {
    VPNScreen()
}
