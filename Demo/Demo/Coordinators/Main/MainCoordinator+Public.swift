import UIKit
import Coordinator

extension MainCoordinator {
    
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
    
    static func configure(with container: UITabBarController,
                          input: Input = Input(),
                          output: Output? = nil) -> MainCoordinator {
        let coordinator = MainCoordinator(container: container)
        let controller = MainCoordinator.Controller()
        controller.input = input
        controller.output = output
        controller.dependencies = dependencies()
        controller.coordinator = coordinator
        coordinator.controller = controller
        return coordinator
    }
}
