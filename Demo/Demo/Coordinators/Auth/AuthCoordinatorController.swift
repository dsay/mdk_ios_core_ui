import Foundation
import Coordinator

protocol AuthCoordinatorControllerOutput: CoordinatorControllerOutput {
    
}

extension AuthCoordinator {
    
    final class Controller: NSObject {
        
        var input: Input!
        var output: Output?
        
        var dependencies: Dependencies!
        
        weak var coordinator: AuthCoordinatorControllerOutput?

        // MARK: - Life cycle
        func start() {

        }
        
        // MARK: - actions

        // MARK: - private methods
        
    }
}
