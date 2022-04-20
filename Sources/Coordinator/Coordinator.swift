import UIKit

public protocol Coordinator: Hashable, DeepLinkSubscriber {
    
    associatedtype Сontainer: UIResponder
    
    var id: String! { get set }
    var container: Сontainer! { get set }
    var children: Set<AnyHashable>! { get set }
    var deepLinkContainer: DeepLinkContainer! { get set}

    init()
    init(with container: Сontainer, _ deepLinkContainer: DeepLinkContainer)
    
    func start()
}

public extension Coordinator {
    
    typealias Completion = () -> Void
    
    init(with container: Сontainer, _ deepLinkContainer: DeepLinkContainer) {
        self.init()
        self.id = UUID().uuidString
        self.children = []
        self.container = container
        self.deepLinkContainer = deepLinkContainer
        self.start()
        self.deepLinkContainer += self
    }
    
    func addChild(_ child: AnyHashable) {
        children.insert(child)
    }
    
    func removeChild(_ child: AnyHashable) {
        children.remove(child)
    }
    
    func removeChildren() {
        children.removeAll()
    }
    
    func wrapAnimation(in action: Completion, completion: Completion? = nil) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        action()
        CATransaction.commit()
    }
}

public extension Coordinator {
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
