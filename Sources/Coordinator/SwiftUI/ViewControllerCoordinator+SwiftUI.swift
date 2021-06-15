import SwiftUI

public extension ViewControllerCoordinator {
    
    func add<V: SwiftUI.View>(_ child: V, frame: CGRect? = nil) {
        let childVC = child.toViewController
        container.addChild(childVC)
        if let frame = frame {
            childVC.view.frame = frame
        }
        container.view.addSubview(childVC.view)
        childVC.didMove(toParent: container)
    }

    func present<V: SwiftUI.View>(_ view: V, animated: Bool = true, completion: Completion? = nil) {
        present(view.toViewController, animated: animated, completion: completion)
    }
}
