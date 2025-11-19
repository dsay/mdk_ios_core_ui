import UIKit

@MainActor
open class WindowCoordinator: Coordinator {
    
    public var id: String = UUID().uuidString
    public var children: Set<AnyHashable> = []
    public var container: UIWindow

    required public init(container: UIWindow) {
        self.container = container
    }
    
    open func start() {
        
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
        coordinator.start()
        
        setRoot(viewControler: coordinator.container, animated: animated)
    }
    
    open func setRoot<C: Coordinator>(_ coordinator: C, animated: Bool = true) where C.Сontainer == UINavigationController {
        removeChildren()
        addChild(coordinator)
        coordinator.start()

        setRoot(viewControler: coordinator.container, animated: animated)
    }
    
    open func setRoot<C: Coordinator>(_ coordinator: C, animated: Bool = true) where C.Сontainer == UITabBarController {
        removeChildren()
        addChild(coordinator)
        coordinator.start()

        setRoot(viewControler: coordinator.container, animated: animated)
    }
    
    open func present(_ viewController: UIViewController, animated: Bool = true, completion: Completion? = nil) {
        guard let root = self.container.rootViewController else {
            return
        }
        
        root.present(viewController, animated: animated, completion: completion)
    }
    
    open func dismiss(animated: Bool = true, completion: Completion? = nil) {
        guard let root = self.container.rootViewController else {
            return
        }
        
        if let presented = root.presentedViewController {
            presented.dismiss(animated: animated, completion: completion)
        } else {
            root.dismiss(animated: animated, completion: completion)
        }
    }
}
