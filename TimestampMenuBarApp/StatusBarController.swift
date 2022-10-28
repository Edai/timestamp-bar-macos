import AppKit

func copyTimestamp() {
    let timestamp = String(Int(NSDate().timeIntervalSince1970))
    let pasteboard = NSPasteboard.general
    pasteboard.clearContents()
    pasteboard.setString(timestamp, forType: .string)
}   

class StatusBarController {
    private var statusBar: NSStatusBar
    private var statusItem: NSStatusItem
    private var popover: NSPopover
    
    init(_ popover: NSPopover) {
        self.popover = popover
        statusBar = NSStatusBar.init()
        statusItem = statusBar.statusItem(withLength: 28.0)
        
        if let statusBarButton = statusItem.button {
            statusBarButton.image = #imageLiteral(resourceName: "TimestampMenuBar")
            statusBarButton.image?.size = NSSize(width: 18.0, height: 18.0)
            statusBarButton.image?.isTemplate = true
            statusBarButton.action = #selector(togglePopover(sender:))
            statusBarButton.target = self
        }
    }
    
    
    @objc func togglePopover(sender: AnyObject) {
        copyTimestamp()
        // if(popover.isShown) {
        //     hidePopover(sender)
        // }
        // else {
        //     showPopover(sender)
        // }
    }
    
    func showPopover(_ sender: AnyObject) {
        if let statusBarButton = statusItem.button {
            popover.show(relativeTo: statusBarButton.bounds, of: statusBarButton, preferredEdge: NSRectEdge.maxY)
        }
    }
    
    func hidePopover(_ sender: AnyObject) {
        popover.performClose(sender)
    }
}
