import XCTest
import Reg // Only testing public funcs so no testable

final class RegTests: XCTestCase {

    static var allTests = [
        ("test_matches_returnsEmptyArrayWhenNoMatches", test_matches_returnsEmptyArrayWhenNoMatches),
    ]

    func test_matches_returnsEmptyArrayWhenNoMatches() {
        let regexes: [Regex] = [
            "^hey",
            "Oh no$",
            "/d+",
            "👪"
        ]
        let nonMatchingStrings: [String] = [
            "Oh hey",
            "No oh",
            "%*(())",
            "🙍"
        ]

        regexes.enumerated().forEach { idx, regex in
            let str = nonMatchingStrings[idx]
            let result = regex.matches(in: str)

            XCTAssertEqual(result, [])
        }
    }

}
