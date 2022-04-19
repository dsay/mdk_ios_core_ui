import Foundation

public protocol ControllerContainer: Coordinator {

    associatedtype Controller = CoordinatorController

    var controller: Controller! { get set }
    
    init(with container: Сontainer, _ controller: Controller, _ deepLinkContainer: DeepLinkContainer)
}

public extension Coordinator where Self: ControllerContainer {
        
    init(with container: Сontainer, _ controller: Controller, _ deepLinkContainer: DeepLinkContainer) {
        self.init()
        self.id = UUID().uuidString
        self.children = []
        self.container = container
        self.controller = controller
        self.deepLinkContainer = deepLinkContainer
        self.start()
        self.deepLinkContainer += self
    }
}
