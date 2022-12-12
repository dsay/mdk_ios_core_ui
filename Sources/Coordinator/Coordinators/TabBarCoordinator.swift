import UIKit

open class TabBarCoordinator<Controller: CoordinatorController>: Coordinator {

    public var id: String!
    public var children: Set<AnyHashable>! 
    public var container: UITabBarController!
    public var controller: Controller!
    public var deepLinkContainer: DeepLinkContainer!

    required public init() {
        
    }
    
    open func start() {
        
    }
    
    @discardableResult
    open func open(deepLink: DeepLink? = nil) -> Bool {
        return false
    }
    
    open func set<T: Coordinator>(_ coordinators: [T], animated: Bool = true, completion: Completion? = nil) where T.Сontainer: UIViewController {
        coordinators.forEach { coordinator in
            addChild(coordinator)
        }
        set(coordinators.compactMap { $0.container }, animated: animated, completion: completion)
    }
    
    open func set<T: Coordinator>(_ coordinators: [T], animated: Bool = true, completion: Completion? = nil) where T.Сontainer: UINavigationController {
        coordinators.forEach { coordinator in
            addChild(coordinator)
        }
        set(coordinators.compactMap { $0.container }, animated: animated, completion: completion)
    }
    
    open func set(_ viewControllers: [UIViewController], animated: Bool = true, completion: Completion? = nil) {
        wrapAnimation(in: {
            self.container.setViewControllers(viewControllers, animated: animated)
        }, completion: completion)
    }
    
    open func select(index: Int, completion: Completion? = nil) {
        wrapAnimation(in: {
            self.container.selectedIndex = index
        }, completion: completion)
    }
}
