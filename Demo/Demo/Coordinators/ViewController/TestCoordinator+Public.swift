import UIKit
import Coordinator

extension TestCoordinator {
    
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
    
    static func configure(with container: UIViewController,
                          input: Input = Input(),
                          output: Output? = nil) -> TestCoordinator {
        let coordinator = TestCoordinator(container: container)
        let controller = TestCoordinator.Controller()
        controller.input = input
        controller.output = output
        controller.dependencies = dependencies()
        controller.coordinator = coordinator
        coordinator.controller = controller
        return coordinator
    }
}
