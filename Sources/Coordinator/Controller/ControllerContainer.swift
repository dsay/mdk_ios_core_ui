import Foundation

public protocol ControllerContainer: Coordinator {

    associatedtype Controller = CoordinatorController

    var controller: Controller! { get set }
    
    init(with container: Сontainer, _ controller: Controller, deepLinkContainer: DeepLinkContainer)
}

public extension ControllerContainer {
        
    init(with container: Сontainer, _ controller: Controller, deepLinkContainer: DeepLinkContainer) {
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
