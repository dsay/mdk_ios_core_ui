import Foundation
import Coordinator

protocol AppCoordinatorControllerOutput: CoordinatorControllerOutput {
    
    func presentAuth()
    func presentMain()
    func presentLaunch()
    func recommendedUpdate(_ url: String)
    func requiredUpdate(_ url: String)
}

extension AppCoordinator {
    
    final class Controller: NSObject {
        
        var input: Input!
        var output: Output?
        
        var dependencies: Dependencies!
        
        weak var coordinator: AppCoordinatorControllerOutput?
        
        // MARK: - Life cycle
        func start() {
            coordinator?.presentLaunch()

            // Chech force update status recommendedUpdate(url) or requiredUpdate(url)
            // then
            // Check Autorisation status presentAuth() or presentMain()
        }
        
        // MARK: - actions

        func enterToForeground() {
            // Chech force update status recommendedUpdate or requiredUpdate
        }
        
        func enterToBackground() {

        }
        
        func update() {
            
        }
        
        // MARK: - private methods
        
    }
}
