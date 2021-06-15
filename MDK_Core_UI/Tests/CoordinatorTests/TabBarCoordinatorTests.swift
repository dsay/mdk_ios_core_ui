import XCTest
@testable import Coordinator

final class TabBarCoordinatorTests: XCTestCase {
    
    var coordinator: TabBarCoordinator!

    override func setUp() {
        super.setUp()
        coordinator = TabBarCoordinator(with: UITabBarController())
    }
    
    func testInit() {
        XCTAssertNotNil(coordinator.container)
    }
    
    func testSet() {
        coordinator.set([UIViewController(), UIViewController(), UIViewController()])
        XCTAssertEqual(coordinator.container.viewControllers?.count, 3)
        XCTAssertEqual(coordinator.container.selectedIndex, 0)
    }
    
    func testSelect() {
        coordinator.set([UIViewController(), UIViewController(), UIViewController()])
        coordinator.select(index: 2)
        XCTAssertEqual(coordinator.container.selectedIndex, 2)
    }
    
    static var allTests = [
        ("testInit", testInit),
        ("testSet", testSet),
        ("testSelect", testSelect),
    ]
}
