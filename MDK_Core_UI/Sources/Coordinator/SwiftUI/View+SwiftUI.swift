import SwiftUI

extension View {
    
    var toViewController: UIViewController {
        UIHostingController(rootView: self)
    }
}
