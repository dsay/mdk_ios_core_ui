import UIKit

@MainActor
open class TabBarCoordinator: Coordinator {

    public var id: String = UUID().uuidString
    public var children: Set<AnyHashable> = []
    public var container: UITabBarController

    required public init(container: UITabBarController) {
        self.container = container
    }
    
    open func start() {
        
    }
    
    open func set<T: Coordinator>(_ coordinators: [T], animated: Bool = true, completion: Completion? = nil) where T.Сontainer: UIViewController {
        removeChildren()
        coordinators.forEach {
            addChild($0)
            $0.start()
        }
        set(coordinators.compactMap { $0.container }, animated: animated, completion: completion)
    }
    
    open func set<T: Coordinator>(_ coordinators: [T], animated: Bool = true, completion: Completion? = nil) where T.Сontainer: UINavigationController {
        removeChildren()
        coordinators.forEach {
            addChild($0)
            $0.start()
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
