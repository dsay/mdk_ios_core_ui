import UIKit
import Coordinator

final class TestCoordinator: ViewControllerCoordinator, TestCoordinatorControllerOutput {
    
    var controller: Controller!
    
    // MARK: - Life cycle
    
    override func start() {
        controller.configure()
    }
    
    // MARK: - actions
    
    // MARK: - private methods
    
}
