import Foundation

import TreeSitter

import TreeSitterBash
import TreeSitterBashQueries
import TreeSitterC
import TreeSitterCQueries
import TreeSitterJSON
import TreeSitterJSONQueries
import TreeSitterMarkdown
import TreeSitterMarkdownQueries
import TreeSitterSwift
import TreeSitterSwiftQueries

public enum TreeSitterLanguage: CaseIterable, Hashable {
    case bash
    case c
    case json
    case markdown
    case swift

    public var parser: OpaquePointer {
        switch self {
        case .bash:
            tree_sitter_bash()
        case .c:
            tree_sitter_c()
        case .json:
            tree_sitter_json()
        case .markdown:
            tree_sitter_markdown()
        case .swift:
            tree_sitter_swift()
        }
    }

    public var highlightQueryURL: URL? {
        switch self {
        case .bash:
            TreeSitterBashQueries.Query.highlightsFileURL
        case .c:
            TreeSitterCQueries.Query.highlightsFileURL
        case .json:
            TreeSitterJSONQueries.Query.highlightsFileURL
        case .markdown:
            TreeSitterMarkdownQueries.Query.highlightsFileURL
        case .swift:
            TreeSitterSwiftQueries.Query.highlightsFileURL
        }
    }

    public var localsQueryURL: URL? {
        switch self {
        case .bash:
            nil
        case .c:
            nil
        case .json:
            nil
        case .markdown:
            nil
        case .swift:
            TreeSitterSwiftQueries.Query.localsFileURL
        }
    }
}
