import Foundation

protocol DebugTreeConvertible {
    /// Returns the tree for the object as a string.
    /// - Note: The default implementation should be used in most cases.
    var tree: NSString { get }

    /// Returns the tree for the object as a string indented to the given number of levels.
    /// - Note: The default implementation should be used in most cases.
    func tree(level: Int) -> String

    /// Returns the description of the object.
    var header: String { get }

    /// Returns the `DebugTreeConvertible` items nested below the current.
    var nestedItems: [DebugTreeConvertible]? { get }
}

extension DebugTreeConvertible {
    var tree: NSString {
        tree(level: 0) as NSString
    }

    func tree(level: Int) -> String {
        let prefix: String = .init(repeating: "|  ", count: level)
        let prefixedHeader = "\n\(prefix)\(header)"
        let nestedText = (nestedItems ?? [])
            .map { $0.tree(level: level + 1) }
            .reduce("", +)

        return prefixedHeader + nestedText + (level == 0 ? "\n" : "")
    }
}
