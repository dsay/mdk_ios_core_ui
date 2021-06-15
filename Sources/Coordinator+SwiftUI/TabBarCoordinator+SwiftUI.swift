import SwiftUI

public extension TabBarCoordinator {
    
    func set<V: SwiftUI.View>(_ views: [V], animated: Bool = true, completion: Completion? = nil) {
        set(views.compactMap { $0.toViewController }, animated: animated, completion: completion)
    }
}
