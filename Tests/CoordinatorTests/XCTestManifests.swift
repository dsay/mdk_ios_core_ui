import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(CoordinatorTests.allTests),
        testCase(NavigationCoordinatorTests.allTests),
        testCase(WindowCoordinatorTests.allTests),
    ]
}
#endif
