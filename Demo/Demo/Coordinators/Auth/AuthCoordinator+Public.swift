import UIKit
import Coordinator

extension AuthCoordinator {
    
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
    
    static func configure(with container: UINavigationController,
                          input: Input = Input(),
                          output: Output? = nil) -> AuthCoordinator {
        let coordinator = AuthCoordinator(container: container)
        let controller = AuthCoordinator.Controller()
        controller.input = input
        controller.output = output
        controller.dependencies = dependencies()
        controller.coordinator = coordinator
        coordinator.controller = controller
        return coordinator
    }
}
