

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ZStack(alignment: .top) {
            HexagonWall{}
                .frame(maxWidth: .infinity, maxHeight: UIScreen.screenHeight-(UIScreen.screenHeight * 0.3), alignment: .top)
             }
    }
}

#Preview {
    ContentView()
}
