import SwiftUI


struct ContentView: View {
    func copyTimestamp() {
        let timestamp = String(Int(NSDate().timeIntervalSince1970))
        let pasteboard = NSPasteboard.general
        pasteboard.clearContents()
        pasteboard.setString(timestamp, forType: .string)
    }   
    
    var body: some View {
        VStack(alignment: .leading) {
            Button("Copy Current Timestamp") {
                copyTimestamp()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
