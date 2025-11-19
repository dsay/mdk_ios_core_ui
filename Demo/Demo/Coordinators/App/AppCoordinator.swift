import UIKit
import Coordinator
import Alert

final class AppCoordinator: WindowCoordinator, AppCoordinatorControllerOutput {
    
    var controller: Controller!
    
    // MARK: - Life cycle
    
    override func start() {
        controller.start()
    }
    
    // MARK: - actions
    
    func appEnterToForeground() {
        controller.enterToForeground()
    }
    
    func appEnterToBackground() {
        controller.enterToBackground()
    }
    
    // MARK: - private methods
    
    func presentLaunch() {
    
    }
    
    func presentAuth() {
        
    }
    
    func presentMain() {
        
    }
    
    func requiredUpdate(_ storeUrl: String) {
        guard let root = self.container.rootViewController else {
            return
        }
        
        // Show required update Alert
        Alert
            .alert(.forceUpdate)
            .action(.update, handler: controller.update)
            .show(root)
    }
    
    func recommendedUpdate(_ storeUrl: String) {
        guard let root = self.container.rootViewController else {
            return
        }
        
        // Show recommended update Alert
        Alert
            .actionSheet(.forceUpdate)
            .action(.cancel)
            .action(.update, handler: controller.update)
            .show(root)
    }
}

open class AlertConfigurator: Alert.Configurator {
        
    public init(title: String? = nil, message: String? = nil) {
        super.init(title: title, message: message, tintColor: .red)
    }
}

extension Alert.Action {
    
    static var delete: Destructive = .init("delete")
    static var cancel: Cancel = .init("cancel")
    static var ok: Default = .init("ok")
    static var update: Default = .init("update")
}

extension Alert.Configurator {
    
    static var empty: AlertConfigurator = .init()
    static var forceUpdate: AlertConfigurator = .init(message: "New version available")
}
