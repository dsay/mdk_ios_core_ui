import UIKit

open class WindowCoordinator: Coordinator {
    
    public var id: String!
    public var children: Set<AnyHashable>!
    public var container: UIWindow!
    
    required public init() {
        
    }
    
    open func start() {
        
    }
    
    public func setRoot(viewControler: UIViewController, animated: Bool = false) {
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
    
    public func setRoot<C: Coordinator>(_ coordinator: C, animated: Bool = true) where C.Сontainer == UIViewController {
        removeChildren()
        addChild(coordinator)
        
        setRoot(viewControler: coordinator.container, animated: animated)
    }
    
    public func setRoot<C: Coordinator>(_ coordinator: C, animated: Bool = true) where C.Сontainer == UINavigationController {
        removeChildren()
        addChild(coordinator)
        
        setRoot(viewControler: coordinator.container, animated: animated)
    }
    
    public func setRoot<C: Coordinator>(_ coordinator: C, animated: Bool = true) where C.Сontainer == UITabBarController {
        removeChildren()
        addChild(coordinator)
        
        setRoot(viewControler: coordinator.container, animated: animated)
    }
}
