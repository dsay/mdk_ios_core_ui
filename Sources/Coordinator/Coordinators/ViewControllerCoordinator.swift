import UIKit

open class ViewControllerCoordinator<Controller: CoordinatorController>: Coordinator {
    
    public var id: String!
    public var children: Set<AnyHashable>!
    public var container: UIViewController!
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
    
    open func addSubview(_ view: UIView) {
        container.view.addSubview(view)
    }
    
    open func add(_ child: UIViewController, frame: CGRect? = nil) {
        container.addChild(child)
        if let frame = frame {
            child.view.frame = frame
        }
        container.view.addSubview(child.view)
        child.didMove(toParent: container)
    }
    
    open func remove(_ child: UIViewController) {
        child.willMove(toParent: nil)
        child.view.removeFromSuperview()
        child.removeFromParent()
    }
    
    open func present(_ viewController: UIViewController, animated: Bool = true, completion: Completion? = nil) {
        container.present(viewController, animated: animated, completion: completion)
    }
}
