import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(VerticalScrollTests.allTests),
        testCase(HorizontalScrollTests.allTests)
    ]
}
#endif
