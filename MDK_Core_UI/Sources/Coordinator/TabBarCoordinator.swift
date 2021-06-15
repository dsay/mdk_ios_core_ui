import UIKit

open class TabBarCoordinator: Coordinator {
    
    public var id: String!
    public var children: Set<AnyHashable>! 
    public var container: UITabBarController!
    
    required public init() {
        
    }
    
    open func start() {
        
    }
    
    public func set<T: Coordinator>(_ coordinators: [T], animated: Bool = true, completion: Completion? = nil) where T.Сontainer: UIViewController {
        coordinators.forEach { coordinator in
            addChild(coordinator)
        }
        set(coordinators.compactMap { $0.container }, animated: animated, completion: completion)
    }
    
    public func set<T: Coordinator>(_ coordinators: [T], animated: Bool = true, completion: Completion? = nil) where T.Сontainer: UINavigationController {
        coordinators.forEach { coordinator in
            addChild(coordinator)
        }
        set(coordinators.compactMap { $0.container }, animated: animated, completion: completion)
    }
    
    public func set(_ viewControllers: [UIViewController], animated: Bool = true, completion: Completion? = nil) {
        wrapAnimation(in: {
            self.container.setViewControllers(viewControllers, animated: animated)
        }, completion: completion)
    }
    
    public func select(index: Int, completion: Completion? = nil) {
        wrapAnimation(in: {
            self.container.selectedIndex = index
        }, completion: completion)
    }
}
