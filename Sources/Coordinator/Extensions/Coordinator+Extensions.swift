import UIKit

public extension Coordinator {
    
    func addChildren(_ children: [AnyHashable]) {
        self.children = Set(children)
    }
    
    func addChild(_ child: AnyHashable) {
        self.children.insert(child)
    }
    
    func removeChild(_ child: AnyHashable) {
        self.children.remove(child)
    }
    
    func removeChildren() {
        self.children.removeAll()
    }
    
    func wrapAnimation(in action: Completion, completion: Completion? = nil) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        action()
        CATransaction.commit()
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
