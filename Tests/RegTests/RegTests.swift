import Reg // Only testing public funcs so no testable
import XCTest

final class RegTests: XCTestCase {
    static var allTests = [
        ("test_matches_returnsEmptyArrayWhenNoMatches", test_matches_returnsEmptyArrayWhenNoMatches),
        ("test_matches_returnsEachMatch", test_matches_returnsEachMatch),
        ("test_hasMatch_returnsFalseWhenNoMatches", test_hasMatch_returnsFalseWhenNoMatches),
        ("test_hasMatch_returnsTrueWhenMatches", test_hasMatch_returnsTrueWhenMatches),
        ("test_firstMatch_returnsNilWhenNoMatches", test_firstMatch_returnsNilWhenNoMatches),
        ("test_firstMatch_returnsFirstMatchWhenMatches", test_firstMatch_returnsFirstMatchWhenMatches),
        ("test_hasMatchEqualsOperator_returnsFalseWhenNoMatches", test_hasMatchEqualsOperator_returnsFalseWhenNoMatches),
        ("test_hasMatchEqualsOperator_returnsTrueWhenMatches", test_hasMatchEqualsOperator_returnsTrueWhenMatches),
        ("test_hasMatchNotEqualsOperator_returnsTrueWhenNoMatches", test_hasMatchNotEqualsOperator_returnsTrueWhenNoMatches),
        ("test_hasMatchNotEqualsOperator_returnsFalseWhenMatches", test_hasMatchNotEqualsOperator_returnsFalseWhenMatches),
        ("test_replacingOccurrences_replacesAllOccurrencesOfPattern", test_replacingOccurrences_replacesAllOccurrencesOfPattern),
        ("test_captures_returnsEmptyWhenNoCapturesFound", test_captures_returnsEmptyWhenNoCapturesFound),
        ("test_captures_returnsAllCapturesWhenCaptures", test_captures_returnsAllCapturesWhenCaptures),
    ]

    private let regexes: [Regex] = [
        "^hey",
        "Oh no$",
        "\\d+",
        "👪+",
    ]

    private let nonMatchingStrings: [String] = [
        "Oh hey",
        "No oh",
        "%*(())",
        "🙍",
    ]

    private let matchingStrings: [String] = [
        "hey man",
        "No oh Oh no",
        "%*(4()45)203-",
        "👪👪👪🙍👪👪👪👪",
    ]

    private let expectedResults: [[String]] = [
        ["hey"],
        ["Oh no"],
        ["4", "45", "203"],
        ["👪👪👪", "👪👪👪👪"],
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

    func test_hasMatchEqualsOperator_returnsFalseWhenNoMatches() {
        regexes.enumerated().forEach { idx, regex in
            let str = nonMatchingStrings[idx]

            let result1 = regex =~ str
            let result2 = str =~ regex

            XCTAssertFalse(result1)
            XCTAssertFalse(result2)
        }
    }

    func test_hasMatchEqualsOperator_returnsTrueWhenMatches() {
        regexes.enumerated().forEach { idx, regex in
            let str = matchingStrings[idx]

            let result1 = regex =~ str
            let result2 = str =~ regex

            XCTAssertTrue(result1)
            XCTAssertTrue(result2)
        }
    }

    func test_hasMatchNotEqualsOperator_returnsTrueWhenNoMatches() {
        regexes.enumerated().forEach { idx, regex in
            let str = nonMatchingStrings[idx]

            let result1 = regex !~ str
            let result2 = str !~ regex

            XCTAssertTrue(result1)
            XCTAssertTrue(result2)
        }
    }

    func test_hasMatchNotEqualsOperator_returnsFalseWhenMatches() {
        regexes.enumerated().forEach { idx, regex in
            let str = matchingStrings[idx]

            let result1 = regex !~ str
            let result2 = str !~ regex

            XCTAssertFalse(result1)
            XCTAssertFalse(result2)
        }
    }

    func test_replacingOccurrences_replacesAllOccurrencesOfPattern() {
        let regex = Regex(#"a?\d+"#)
        let string = "dskfj123lkdjfka123"
        let expectedString = "dskfjzzzlkdjfkzzz"

        let result = regex.replacingOccurrences(in: string, with: "zzz")

        XCTAssertEqual(result, expectedString)
    }

    func test_captures_returnsEmptyWhenNoCapturesFound() {
        let regex = Regex(#"a(\d+{5})"#)
        let string = "dskfj123lkdjfka123"
        let expectedCaptures: [String] = []

        let result = regex.captures(in: string)

        XCTAssertEqual(result, expectedCaptures)
    }

    func test_captures_returnsAllCapturesWhenCaptures() {
        let regex = Regex(#"a(\d{5})"#)
        let string = "dskfja12345lkdjfka123"
        let expectedCaptures: [String] = ["a12345", "12345"]

        let result = regex.captures(in: string)

        XCTAssertEqual(result, expectedCaptures)
    }
}
