import SwiftUI

public extension WindowCoordinator {
    
     func setRoot<V: SwiftUI.View>(view: V, animated: Bool = false) {
        setRoot(viewControler: view.toViewController, animated: animated)
     }
}
