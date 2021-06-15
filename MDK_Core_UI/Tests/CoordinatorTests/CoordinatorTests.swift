import XCTest
@testable import Coordinator

class TestCoordinator: Coordinator {

    public var id: String! = UUID().uuidString
    public var children: Set<AnyHashable>! = []
    public var container: UIView!
    
    required public init() {
        
    }
    
    func start() {
        
    }
}

final class CoordinatorTests: XCTestCase {

    var coordinator: TestCoordinator!

    override func setUp() {
        super.setUp()
        coordinator = TestCoordinator(with: UIView())
    }
    
    func testCoordinatorInit() {
        XCTAssertNotNil(coordinator.container)
    }
    
    func testCoordinatorAddChild() {
        let child = TestCoordinator(with: UIView())
        
        coordinator.addChild(child)
        
        XCTAssertEqual(coordinator.children.count, 1)
    }
    
    func testCoordinatorRemoveChild() {
        let child = TestCoordinator(with: UIView())

        coordinator.addChild(child)
        coordinator.removeChildren()

        XCTAssertEqual(coordinator.children.count, 0)
    }
    
    func testCoordinatorRemoveAllChild() {
        let child = TestCoordinator(with: UIView())
        let child1 = TestCoordinator(with: UIView())

        coordinator.addChild(child)
        coordinator.addChild(child1)
        coordinator.removeChildren()

        XCTAssertEqual(coordinator.children.count, 0)
    }
    
    static var allTests = [
        ("testCoordinatorInit", testCoordinatorInit),
        ("testCoordinatorAddChild", testCoordinatorAddChild),
        ("testCoordinatorRemoveChild", testCoordinatorRemoveChild),
        ("testCoordinatorRemoveAllChild", testCoordinatorRemoveAllChild),
    ]
}
