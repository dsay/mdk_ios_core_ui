import XCTest
@testable import Coordinator

final class WindowCoordinatorTests: XCTestCase {
    
    var coordinator: WindowCoordinator!

    override func setUp() {
        super.setUp()
        coordinator = WindowCoordinator(with: UIWindow())
    }
    
    func testInit() {
        XCTAssertNotNil(coordinator.container)
    }
    
    func testSet() {
        coordinator.setRoot(viewControler: UINavigationController())
        XCTAssertNotNil(coordinator.container.rootViewController)
    }
    
    func testSetAnimation() {
        let vc = UIViewController()
        coordinator.setRoot(viewControler: UIViewController())
        coordinator.setRoot(viewControler: vc, animated: true)

        XCTAssertEqual(coordinator.container.rootViewController, vc)
    }
    
    static var allTests = [
        ("testSet", testSet),
        ("testSetAnimation", testSetAnimation),
    ]
}
