
import Combine
import NetworkExtension

class ConnectionViewModel: ObservableObject {
    @Published var vpnStatus: NEVPNStatus = .disconnected
    @Published var connectionTime: TimeInterval = 0
    private var cancellable: AnyCancellable?
    private var connectionService : ConnectionService! = ConnectionService()
    private var connectionStartTime: Date?
    private var timer: Timer?

    init() {
        connectionService.initialize(localizedDescription: "wireguard_vpn")
        setupVPNStatusObserver()
    }

    private func setupVPNStatusObserver() {
        cancellable = NotificationCenter.default.publisher(for: .NEVPNStatusDidChange)
            .compactMap { notification -> (NEVPNStatus)? in
                let nevpnconn = notification.object as? NEVPNConnection
                return nevpnconn?.status
            }
            .sink { [weak self] status in
                self?.vpnStatus = status
                self?.handleVPNStatusChange(status)
            }
    }

    private func handleVPNStatusChange(_ status: NEVPNStatus) {
        switch status {
        case .connected:
            startConnectionTimer() // Start tracking connection time
        case .disconnected:
            stopConnectionTimer() // Stop tracking connection time
        default:
            break
        }
    }

    private func startConnectionTimer() {
        connectionStartTime = Date()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let startTime = self?.connectionStartTime else { return }
            self?.connectionTime = Date().timeIntervalSince(startTime)
        }
    }

    private func stopConnectionTimer() {
        timer?.invalidate()
        timer = nil
        connectionTime = 0
        connectionStartTime = nil
    }

    func connect(server: ServerInfo) {
        connectionService.connect(
            serverAddress: server.endpoint,
            wgQuickConfig: server.fullConfig,
            providerBundleIdentifier: "com.adscloud.defensewall.SafeWebWireguradExtension"
        )
    }

    func disconnect() {
        connectionService.disconnect()
    }
}
