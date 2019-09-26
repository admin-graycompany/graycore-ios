/// Paths of the scenes for the router
public struct RouterPath: RawRepresentable, Equatable, Hashable {
	public typealias RawValue = String
	public var rawValue: String
	public init(rawValue: RawValue) {
		self.rawValue = rawValue
	}
}
