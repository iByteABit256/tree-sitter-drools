import XCTest
import SwiftTreeSitter
import TreeSitterDrools

final class TreeSitterDroolsTests: XCTestCase {
    func testCanLoadGrammar() throws {
        let parser = Parser()
        let language = Language(language: tree_sitter_drools())
        XCTAssertNoThrow(try parser.setLanguage(language),
                         "Error loading Drools grammar")
    }
}
