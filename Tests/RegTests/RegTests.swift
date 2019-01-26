import XCTest
import Reg // Only testing public funcs so no testable

final class RegTests: XCTestCase {

    static var allTests = [
        ("test_matches_returnsEmptyArrayWhenNoMatches", test_matches_returnsEmptyArrayWhenNoMatches),
        ("test_matches_returnsEachMatch", test_matches_returnsEachMatch),
    ]

    private let regexes: [Regex] = [
        "^hey",
        "Oh no$",
        "\\d+",
        "👪+"
    ]

    func test_matches_returnsEmptyArrayWhenNoMatches() {
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

    func test_matches_returnsEachMatch() {
        let matchingStrings: [String] = [
            "hey man",
            "No oh Oh no",
            "%*(4()45)203-",
            "👪👪👪🙍👪👪👪👪"
        ]
        let expectedResults: [[String]] = [
            ["hey"],
            ["Oh no"],
            ["4", "45", "203"],
            ["👪👪👪", "👪👪👪👪"]
        ]

        regexes.enumerated().forEach { idx, regex in
            let str = matchingStrings[idx]

            let result = regex.matches(in: str)

            let expected = expectedResults[idx]
            XCTAssertEqual(result, expected)
        }
    }

}
