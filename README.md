# DebugTreeConvertible
Debug util to easily pretty-print a human-readable tree structure.

## Example

```
/// Print the visible view hierarchy.
extension UIView: DebugTreeConvertible {
    var header: String {
        "\(Self.self): \(frame)"
    }

    var nestedItems: [DebugTreeConvertible]? {
        subviews.filter(\.isVisible)
    }

    private var isVisible: Bool {
        return !isHidden && frame.height > 0 && frame.width > 0
    }
}
```

`(lldb) po myView.tree`
