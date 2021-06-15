import SwiftUI

public extension NavigationCoordinator {
    
    func push<V: SwiftUI.View>(_ view: V, animated: Bool = true, completion: Completion? = nil) {
        push(view.toViewController, animated: animated, completion: completion)
    }
    
    func set<V: SwiftUI.View>(_ views: [V], animated: Bool = true, completion: Completion? = nil) {
        set(views.compactMap { $0.toViewController }, animated: animated, completion: completion)
    }
    
    func present<V: SwiftUI.View>(_ view: V, animated: Bool = true, completion: Completion? = nil) {
        present(view.toViewController, animated: animated, completion: completion)
    }
    
    func add<V: SwiftUI.View>(_ views: [V], animated: Bool = true, completion: Completion? = nil) {
        add(views.compactMap { $0.toViewController }, animated: animated, completion: completion)
    }
}
