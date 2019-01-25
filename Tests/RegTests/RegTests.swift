import XCTest
@testable import Reg

final class RegTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Reg().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
