import Foundation

import TreeSitter

import TreeSitterSwift
import TreeSitterSwiftQueries

public enum TreeSitterLanguage: CaseIterable, Hashable {
    case swift

    public var parser: OpaquePointer {
        switch self {
        case .swift:
            tree_sitter_swift()
        }
    }

    public var highlightQueryURL: URL? {
        switch self {
        case .swift:
            TreeSitterSwiftQueries.Query.highlightsFileURL
        }
    }

    public var localsQueryURL: URL? {
        switch self {
        case .swift:
            TreeSitterSwiftQueries.Query.localsFileURL
        }
    }
}
