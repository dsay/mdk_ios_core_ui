import UIKit
import Coordinator

extension AppCoordinator {
    
    struct Dependencies {

    }
    
    struct Input {
        
    }
    
    struct Output {
        enum Action {
        }
        
        let action: (Action) -> Void
    }
    
    static func dependencies() -> Dependencies {
        .init()
    }
    
    static func configure(with container: UIWindow,
                          input: Input = Input(),
                          output: Output? = nil) -> AppCoordinator {
        let coordinator = AppCoordinator(container: container)
        let controller = AppCoordinator.Controller()
        controller.input = input
        controller.output = output
        controller.dependencies = dependencies()
        controller.coordinator = coordinator
        coordinator.controller = controller
        return coordinator
    }
}
