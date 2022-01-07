# Reg

[![Swift Version](https://img.shields.io/badge/Swift-5.5.x-orange.svg)]()

Reg is a friendly wrapper for NSRegularExpression

## TLDR
Turn this:
```swift
let range = NSRange(location: 0, length: string.utf16.count)
let regex = try? NSRegularExpression(pattern: "^gummy bears have no cares")
let str = "gummy bears have no cares"
let firstMatch = regexs?.firstMatch(in: str, options: [], range: range)
let matchRange = Range(firstMatch.range, in: str)

let matchStr = String(str[matchRange])
```

into this:
```swift
let str = "gummy bears have no cares"
let matchStr = "^gummy bears have no cares".firstMatch(in: str)
```

## Features

- matches
- hasMatch
- firstMatch
- replacingOccurrences
- captures
- Operators
    - =~
    - !~
