import UIKit

@MainActor
open class ViewControllerCoordinator: Coordinator {
    
    public var id: String = UUID().uuidString
    public var children: Set<AnyHashable> = []
    public var container: UIViewController

    required public init(container: UIViewController) {
        self.container = container
    }
    
    open func start() {
        
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
        self.container.present(viewController, animated: animated, completion: completion)
    }
    
    open func dismiss(animated: Bool = true, completion: Completion? = nil) {
        if let presented = self.container.presentedViewController {
            presented.dismiss(animated: animated, completion: completion)
        } else {
            self.container.dismiss(animated: animated, completion: completion)
        }
    }
}
