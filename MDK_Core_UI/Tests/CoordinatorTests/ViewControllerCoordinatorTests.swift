import XCTest
@testable import Coordinator

final class ViewControllerCoordinatorTests: XCTestCase {
    
    var coordinator: ViewControllerCoordinator!

    override func setUp() {
        super.setUp()
        coordinator = ViewControllerCoordinator(with: UIViewController())
    }
    
    func testInit() {
        XCTAssertNotNil(coordinator.container)
    }
    
    func testAddSubview() {
        coordinator.addSubview(UIView())
        XCTAssertEqual(coordinator.container.view.subviews.count, 1)
    }
    
    func testAddChild() {
        let vc = UIViewController()
        coordinator.add(vc)
        
        XCTAssertNotNil(vc.parent)
        XCTAssertNotNil(vc.view.superview)
        XCTAssertEqual(coordinator.container.children.count, 1)
    }
    
    func testRemoveChild() {
        let vc = UIViewController()

        coordinator.add(vc)
        coordinator.remove(vc)

        XCTAssertEqual(coordinator.container.children.count, 0)
        XCTAssertEqual(coordinator.container.view.subviews.count, 0)
    }
    
    func testPresented() {
        let vc = UIViewController()
        
        coordinator.present(vc)
        
        XCTAssertNotNil(coordinator.container.presentationController)
    }
    
    static var allTests = [
        ("testInit", testInit),
        ("testAddChild", testAddChild),
        ("testRemoveChild", testRemoveChild),
        ("testAddSubview", testAddSubview),
        ("testPresented", testPresented),
    ]
}
