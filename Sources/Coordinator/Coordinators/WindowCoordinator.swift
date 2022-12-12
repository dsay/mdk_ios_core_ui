import UIKit

open class WindowCoordinator<Controller: CoordinatorController>: Coordinator {
    
    public var id: String!
    public var children: Set<AnyHashable>!
    public var container: UIWindow!
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
    
    open func setRoot(viewControler: UIViewController, animated: Bool = false) {
        if let snapshot = container.rootViewController?.view.snapshotView(afterScreenUpdates: true), animated {
            viewControler.view.addSubview(snapshot)
            container.rootViewController = viewControler
            
            UIView.animate(
                withDuration: 0.35,
                delay: 0.0,
                options: [.curveEaseOut],
                animations: {
                    snapshot.alpha = 0
                }) { _ in
                snapshot.removeFromSuperview()
            }
        } else {
            container.rootViewController = viewControler
        }
    }
    
    open func setRoot<C: Coordinator>(_ coordinator: C, animated: Bool = true) where C.Сontainer == UIViewController {
        removeChildren()
        addChild(coordinator)
        
        setRoot(viewControler: coordinator.container, animated: animated)
    }
    
    open func setRoot<C: Coordinator>(_ coordinator: C, animated: Bool = true) where C.Сontainer == UINavigationController {
        removeChildren()
        addChild(coordinator)
        
        setRoot(viewControler: coordinator.container, animated: animated)
    }
    
    open func setRoot<C: Coordinator>(_ coordinator: C, animated: Bool = true) where C.Сontainer == UITabBarController {
        removeChildren()
        addChild(coordinator)
        
        setRoot(viewControler: coordinator.container, animated: animated)
    }
}
