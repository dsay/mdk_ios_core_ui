import Foundation
import Coordinator

protocol TestCoordinatorControllerOutput: CoordinatorControllerOutput {
    
}

extension TestCoordinator {
    
    final class Controller: NSObject {
        
        var input: Input!
        var output: Output?
        
        var dependencies: Dependencies!

        weak var coordinator: TestCoordinatorControllerOutput?
        
        // MARK: - Life cycle
        func configure() {

        }
        
        // MARK: - actions

        // MARK: - private methods
        
    }
}
