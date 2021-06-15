import XCTest
@testable import Coordinator

class ViewController: UIViewController {
    
}

final class NavigationCoordinatorTests: XCTestCase {
    
    var coordinator: NavigationCoordinator!

    override func setUp() {
        super.setUp()
        coordinator = NavigationCoordinator(with: UINavigationController())
    }
    
    func testNavigationInit() {
        XCTAssertNotNil(coordinator.container)
    }
    
    func testNavigationPush() {
        coordinator.push(UIViewController(), animated: false)
        XCTAssertEqual(coordinator.container.viewControllers.count, 1)
    }
    
    func testNavigationSet() {
        coordinator.set([UIViewController(), UIViewController(), UIViewController(), UIViewController()], animated: false)
        XCTAssertEqual(coordinator.container.viewControllers.count, 4)
    }
    
    func testNavigationPop() {
        coordinator.push(UIViewController(), animated: false)
        coordinator.push(UIViewController(), animated: false)
        XCTAssertEqual(coordinator.container.viewControllers.count, 2)
        coordinator.pop(animated: false)
        XCTAssertEqual(coordinator.container.viewControllers.count, 1)
    }
    
    func testNavigationPopToControllerClass() {
        coordinator.push(ViewController(), animated: false)
        coordinator.push(UIViewController(), animated: false)
        coordinator.push(UIViewController(), animated: false)

        coordinator.pop(viewController: ViewController.self, animated: false)
        XCTAssertEqual(coordinator.container.viewControllers.count, 1)
    }
    
    func testNavigationPopToControllerIndex() {
        coordinator.push(UIViewController(), animated: false) // index = 0
        coordinator.push(UIViewController(), animated: false) // index = 1
        coordinator.push(UIViewController(), animated: false) // index = 2

        coordinator.pop(1, animated: false)
        XCTAssertEqual(coordinator.container.viewControllers.count, 2)
    }
    
    func testNavigationPopRoot() {
        coordinator.push(UIViewController(), animated: false)
        coordinator.push(UIViewController(), animated: false)
        coordinator.push(UIViewController(), animated: false)

        coordinator.popToRoot(animated: false)
        XCTAssertEqual(coordinator.container.viewControllers.count, 1)
    }
    
    func testNavigationAdd() {
        coordinator.push(UIViewController(), animated: false)
        
        coordinator.add([UIViewController(), UIViewController(), UIViewController()], animated: false)
        XCTAssertEqual(coordinator.container.viewControllers.count, 4)
    }
    
    func testNavigationReplace() {
        let vc = UIViewController()
        
        coordinator.set([UIViewController(), vc, UIViewController(), UIViewController()], animated: false)
        coordinator.replaceViewControllers(after: vc, with: [UIViewController()], animated: false)
        XCTAssertEqual(coordinator.container.viewControllers.count, 3)
        XCTAssertEqual(coordinator.container.viewControllers[1], vc)
    }
    
    static var allTests = [
        ("testNavigationInit", testNavigationInit),
        ("testNavigationPush", testNavigationPush),
        ("testNavigationSet", testNavigationSet),
        ("testNavigationPop", testNavigationPop),
        ("testNavigationPopToControllerClass", testNavigationPopToControllerClass),
        ("testNavigationPopToControllerIndex", testNavigationPopToControllerIndex),
        ("testNavigationPopRoot", testNavigationPopRoot),
        ("testNavigationAdd", testNavigationAdd),
        ("testNavigationReplace", testNavigationReplace),
    ]
}
