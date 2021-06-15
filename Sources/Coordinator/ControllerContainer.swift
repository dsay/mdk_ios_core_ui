import Foundation

public protocol ControllerContainer: Coordinator {

    associatedtype Controller = CoordinatorController

    var controller: Controller! { get set }
    
    init(with container: Сontainer, _ controller: Controller)
}

public extension ControllerContainer {
        
    init(with container: Сontainer, _ controller: Controller) {
        self.init()
        self.id = UUID().uuidString
        self.children = []
        self.container = container
        self.controller = controller
        self.start()
    }
}
