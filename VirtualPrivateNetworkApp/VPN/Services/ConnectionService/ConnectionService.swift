import Foundation
import NetworkExtension








class ConnectionService{
    private static var utils : VPNUtils! = VPNUtils()
    private var initialized : Bool = false

    
    public func initialize(localizedDescription: String){
        ConnectionService.utils.localizedDescription = localizedDescription
        ConnectionService.utils.loadProviderManager { (err: Error?) in
            if err == nil {
            } else {
              
            }
        }
    }
    
    
    public func connect(serverAddress: String, wgQuickConfig: String, providerBundleIdentifier:String){
        ConnectionService.utils.configureVPN(serverAddress: serverAddress, wgQuickConfig: wgQuickConfig, providerBundleIdentifier: providerBundleIdentifier) { success in
                print(success)
            }
        }
    
    
    public func disconnect(){
        ConnectionService.utils.stopVPN(){ succes in
        }
    }
}




@available(iOS 15.0, *)
class VPNUtils {
  var providerManager: NETunnelProviderManager!
  var providerBundleIdentifier: String?
  var localizedDescription: String?
  var groupIdentifier: String?
  var serverAddress: String?
   
  func loadProviderManager(completion: @escaping (_ error: Error?) -> Void) {
    NETunnelProviderManager.loadAllFromPreferences { (managers, error) in
      if error == nil {
        self.providerManager = managers?.first ?? NETunnelProviderManager()
        completion(nil)
      } else {
        completion(error)
      }
    }
  }

  func onVpnStatusChanged(notification: NEVPNStatus) {
    switch notification {
    case .connected:
      break
    case .connecting:
      break
    case .disconnected:
      break
    case .disconnecting:
      break
    case .invalid:
        break
    case .reasserting:
        break
    @unknown default:
        break
    }
  }

  func onVpnStatusChangedString(notification: NEVPNStatus?) -> String? {
    if notification == nil {
      return "disconnected"
    }
    switch notification! {
    case NEVPNStatus.connected:
      return "connected"
    case NEVPNStatus.connecting:
      return "connecting"
    case NEVPNStatus.disconnected:
      return "disconnected"
    case NEVPNStatus.disconnecting:
      return "disconnecting"
    case NEVPNStatus.invalid:
      return "invalid"
    case NEVPNStatus.reasserting:
      return "reasserting"
    default:
      return ""
    }
  }

  func currentStatus() -> String? {
    if self.providerManager != nil {
      return onVpnStatusChangedString(notification: self.providerManager.connection.status)
    } else {
      return "disconnected"
    }
    //        return "DISCONNECTED"
  }
   
    func configureVPN(
        serverAddress: String?,
        wgQuickConfig: String?,
        providerBundleIdentifier: String?,
        completion: @escaping (Bool) -> Void
      ) {
          NETunnelProviderManager.loadAllFromPreferences{ tunnelManagersInSettings, error in
              if let error = error {
                  NSLog("Error (loadAllFromPreferences): \(error)")
                  completion(false)
                  return
              }
              let preExistingTunnelManager = tunnelManagersInSettings?.first
              let tunnelManager = preExistingTunnelManager ?? NETunnelProviderManager()
              
              let protocolConfiguration = NETunnelProviderProtocol()
              
              protocolConfiguration.providerBundleIdentifier = providerBundleIdentifier!
              protocolConfiguration.serverAddress = serverAddress
              protocolConfiguration.providerConfiguration = [
                  "wgQuickConfig": wgQuickConfig!
              ]
              
              tunnelManager.protocolConfiguration = protocolConfiguration
              tunnelManager.isEnabled = true
              
              tunnelManager.saveToPreferences { error in
                  if let error = error {
                      NSLog("Error (saveToPreferences): \(error)")
                      completion(false)
                  } else {
                      tunnelManager.loadFromPreferences { error in
                          if let error = error {
                              NSLog("Error (loadFromPreferences): \(error)")
                              completion(false)
                          } else {
                              NSLog("Starting the tunnel")
                              if let session = tunnelManager.connection as? NETunnelProviderSession {
                                  do {
                                      try session.startTunnel(options: nil)
                                      completion(true)
                                  } catch {
                                      NSLog("Error (startTunnel): \(error)")
                                      completion(false)
                                  }
                              } else {
                                  NSLog("tunnelManager.connection is invalid")
                                  completion(false)
                              }
                          }
                      }
                  }
              }
          }
         
      }
  
  func stopVPN(completion: @escaping (Bool?) -> Void) {
      NETunnelProviderManager.loadAllFromPreferences { tunnelManagersInSettings, error in
          if let error = error {
              NSLog("Error (loadAllFromPreferences): \(error)")
              completion(false)
              return
          }
          
          if let tunnelManager = tunnelManagersInSettings?.first {
              guard let session = tunnelManager.connection as? NETunnelProviderSession else {
                  NSLog("tunnelManager.connection is invalid")
                  completion(false)
                  return
              }
              switch session.status {
              case .connected, .connecting, .reasserting:
                  NSLog("Stopping the tunnel")
                  session.stopTunnel()
                  completion(true)
              default:
                  completion(false)
              }
          } else {
              completion(false)
          }
      }
  }
   
}
