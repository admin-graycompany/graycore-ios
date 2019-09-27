import Foundation

/// Connection between View and Model (UI/Business Logic)
public class ViewModel<T> {
	
	/// Closure to be called when the data is set
	public typealias Listener = (T?) -> Void
	
	/// Generic data. Must be specified by the subclasses
	private(set) var data: T? {
		didSet {
			listener?(data)
		}
	}
	
	/// Listener to be called when data is set
	private var listener: Listener?
	
	/// When bind is called, the given closure will be stored in the ViewModel and will be called everytime the data is set
	///
	/// - Parameter listener: Closure to be called when data is set
	public func bind(_ listener: @escaping Listener) {
		self.listener = listener
	}
	
	/// Replace the current value of the data property
	///
	/// - Parameter data: Value to be set
	public func set(data: T?) {
		self.data = data
	}
	
	required public init() {}
}

// MARK: - Value Types
extension ViewModel where T: Any {
	
	/// Updates data with a closure for value types
	///
	/// - Parameter block: Closure with the current data value
	public func update(block: (T?) -> T?) {
		data = block(data)
	}
}

// MARK: - Reference Types
extension ViewModel where T: AnyObject {
	
	/// Updates data with a closure for reference types
	///
	/// - Parameter block: Closure with the current data value
	public func update(block: (T?) -> Void) {
		block(data)
		set(data: data)
	}
}
