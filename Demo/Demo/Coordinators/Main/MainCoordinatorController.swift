import Foundation
import Coordinator

protocol MainCoordinatorControllerOutput: CoordinatorControllerOutput {
    
}

extension MainCoordinator {
    
    final class Controller: NSObject {
        
        var input: Input!
        var output: Output?
        
        var dependencies: Dependencies!
        
        weak var coordinator: MainCoordinatorControllerOutput?

        // MARK: - Life cycle
        func start() {

        }
        
        // MARK: - actions

        // MARK: - private methods
        
    }
}
