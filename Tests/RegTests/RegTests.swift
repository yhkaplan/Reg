import XCTest
import Reg // Only testing public funcs so no testable

final class RegTests: XCTestCase {

    static var allTests = [
        ("test_matches_returnsEmptyArrayWhenNoMatches", test_matches_returnsEmptyArrayWhenNoMatches),
        ("test_matches_returnsEachMatch", test_matches_returnsEachMatch),
        ("test_hasMatch_returnsFalseWhenNoMatches", test_hasMatch_returnsFalseWhenNoMatches),
        ("test_hasMatch_returnsTrueWhenMatches", test_hasMatch_returnsTrueWhenMatches),
        ("test_firstMatch_returnsNilWhenNoMatches", test_firstMatch_returnsNilWhenNoMatches),
        ("test_firstMatch_returnsFirstMatchWhenMatches", test_firstMatch_returnsFirstMatchWhenMatches),
    ]

    private let regexes: [Regex] = [
        "^hey",
        "Oh no$",
        "\\d+",
        "👪+"
    ]

    private let nonMatchingStrings: [String] = [
        "Oh hey",
        "No oh",
        "%*(())",
        "🙍"
    ]

    private let matchingStrings: [String] = [
        "hey man",
        "No oh Oh no",
        "%*(4()45)203-",
        "👪👪👪🙍👪👪👪👪"
    ]

    private let expectedResults: [[String]] = [
        ["hey"],
        ["Oh no"],
        ["4", "45", "203"],
        ["👪👪👪", "👪👪👪👪"]
    ]

    func test_matches_returnsEmptyArrayWhenNoMatches() {
        regexes.enumerated().forEach { idx, regex in
            let str = nonMatchingStrings[idx]

            let result = regex.matches(in: str)

            XCTAssertEqual(result, [])
        }
    }

    func test_matches_returnsEachMatch() {
        regexes.enumerated().forEach { idx, regex in
            let str = matchingStrings[idx]

            let result = regex.matches(in: str)

            let expected = expectedResults[idx]
            XCTAssertEqual(result, expected)
        }
    }

    func test_hasMatch_returnsFalseWhenNoMatches() {
        regexes.enumerated().forEach { idx, regex in
            let str = nonMatchingStrings[idx]

            let result = regex.hasMatch(in: str)

            XCTAssertFalse(result)
        }
    }

    func test_hasMatch_returnsTrueWhenMatches() {
        regexes.enumerated().forEach { idx, regex in
            let str = matchingStrings[idx]

            let result = regex.hasMatch(in: str)

            XCTAssertTrue(result)
        }
    }

    func test_firstMatch_returnsNilWhenNoMatches() {
        regexes.enumerated().forEach { idx, regex in
            let str = nonMatchingStrings[idx]

            let result = regex.firstMatch(in: str)

            XCTAssertNil(result)
        }
    }

    func test_firstMatch_returnsFirstMatchWhenMatches() {
        regexes.enumerated().forEach { idx, regex in
            let str = matchingStrings[idx]

            let result = regex.firstMatch(in: str)

            let expected = expectedResults[idx].first!
            XCTAssertEqual(result, expected)
        }
    }
}
