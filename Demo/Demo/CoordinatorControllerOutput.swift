import UIKit
import Coordinator
import Alert

public protocol CoordinatorControllerOutput: AnyObject {
    
    func startActivity()
    func stopActivity()
    
    func catchError(_ error: Error)
}

extension CoordinatorControllerOutput where Self: Coordinator, Self.Сontainer == UIWindow {
    
    func startActivity() {
        
    }
    
    func stopActivity() {
        
    }
    
    func catchError(_ error: Error) {
        
    }
}

extension CoordinatorControllerOutput where Self: Coordinator, Self.Сontainer == UITabBarController {
    
    func startActivity() {
        
    }
    
    func stopActivity() {
        
    }
    
    func catchError(_ error: Error) {
        
    }
}

extension CoordinatorControllerOutput where Self: Coordinator, Self.Сontainer == UINavigationController {
    
    func startActivity() {
        
    }
    
    func stopActivity() {
        
    }
    
    func catchError(_ error: Error) {
        
    }
}

extension CoordinatorControllerOutput where Self: Coordinator, Self.Сontainer == UIViewController {
    
    func startActivity() {
        
    }
    
    func stopActivity() {
        
    }
    
    func catchError(_ error: Error) {
        
    }
}

enum MainTab: Int {
    case home = 0
    
    var tabInfo: TabInfo {
        switch self {
        case .home:
            return TabInfo(title: "Home",
                           image: UIImage(named: "ic_home"),
                           selectedImage: UIImage(named: "ic_home_selected"))
        }
    }
    
    struct TabInfo {
        let title: String
        let image: UIImage?
        let selectedImage: UIImage?
    }
}

extension UIViewController {
    
    func configureMainTab(_ tab: MainTab) {
        tabBarItem = UITabBarItem.init(title: "",
                                       image:  tab.tabInfo.image,
                                       selectedImage:  tab.tabInfo.selectedImage)
    }
    
}
