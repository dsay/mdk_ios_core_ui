import UIKit
import Coordinator

final class AuthCoordinator: NavigationCoordinator, AuthCoordinatorControllerOutput {
    
    var controller: Controller!
    
    // MARK: - Life cycle
    
    override func start() {
        controller.start()
    }
    
    // MARK: - actions
    
    // MARK: - private methods
    
}
