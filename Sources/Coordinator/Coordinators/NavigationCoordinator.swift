import UIKit

open class NavigationCoordinator<Controller: CoordinatorController>: Coordinator {
    
    public var id: String!
    public var children: Set<AnyHashable>! 
    public var container: UINavigationController!
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

    open func push(_ viewController: UIViewController, animated: Bool = true, completion: Completion? = nil) {
        wrapAnimation(in: {
            if self.container.viewControllers.isEmpty {
                self.container.setViewControllers([viewController], animated: false)
            } else {
                self.container.pushViewController(viewController, animated: animated)
            }
        }, completion: completion)
    }
    
    open func pop(animated: Bool = true, completion: Completion? = nil) {
        wrapAnimation(in: {
            self.container.popViewController(animated: animated)
        }, completion: completion)
    }
    
    open func pop(viewController ofClass: AnyClass, animated: Bool = true, completion: Completion? = nil) {
        wrapAnimation(in: {
            if let vc = self.container.viewControllers.filter({$0.isKind(of: ofClass)}).last {
                self.container.popToViewController(vc, animated: animated)
            }
        }, completion: completion)
    }
    
    open func pop(_ index: Int, animated: Bool = true, completion: Completion? = nil) {
        wrapAnimation(in: {
            if self.container.viewControllers.count > index {
                let vc = self.container.viewControllers[index]
                self.container.popToViewController(vc, animated: animated)
            }
        }, completion: completion)
    }
    
    open func popToRoot(animated: Bool = true, completion: Completion? = nil) {
        wrapAnimation(in: {
            self.container.popToRootViewController(animated: animated)
        }, completion: completion)
    }
    
    open func set(_ viewControllers: [UIViewController],
                    animated: Bool = true,
                    completion: Completion? = nil)
    {
        wrapAnimation(in: {
            self.container.setViewControllers(viewControllers, animated: animated)
        }, completion: completion)
    }
    
    open func present(_ viewController: UIViewController, animated: Bool = true, completion: Completion? = nil) {
        container.present(viewController, animated: animated, completion: completion)
    }
    
    open func dismiss(animated: Bool = true, completion: Completion? = nil) {
        guard container.presentedViewController != nil else {
            return
        }
        container.dismiss(animated: animated, completion: completion)
    }
    
    open func add(_ viewControllers: [UIViewController],
                    animated: Bool = true,
                    completion: Completion? = nil)
    {
        wrapAnimation(in: {
            let controllers = self.container.viewControllers + viewControllers
            self.container.setViewControllers(controllers, animated: animated)
        }, completion: completion)
    }
    
    open func pop(to viewController: UIViewController,
                    animated: Bool = true,
                    completion: Completion? = nil)
    {
        wrapAnimation(in: {
            self.container.popToViewController(viewController, animated: animated)
        }, completion: completion)
    }
    
    open func replaceViewControllers(after: UIViewController,
                                       with viewControllers: [UIViewController],
                                       animated: Bool = true,
                                       completion: Completion? = nil)
    {
        var stack = container.viewControllers
        guard !stack.isEmpty, let viewController = stack.first(where: { $0 == after }) else {
            completion?()
            return
        }
        var proceed = true
        while proceed {
            if let current = stack.last {
                if current == viewController {
                    proceed = false
                } else {
                    stack.removeLast()
                }
            }
            if stack.isEmpty { proceed = false }
        }
        stack += viewControllers
        set(stack, animated: animated, completion: completion)
    }
    
}
