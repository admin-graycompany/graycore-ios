import Foundation

/// Error struct
public struct CustomError: Error, Equatable {
	
	/// Message detailing the error
	let message: String
	
	public init(message: String) {
		self.message = message
	}
}

// MARK: - LocalizedError
extension CustomError: LocalizedError {
	
	public var errorDescription: String? {
		return message
	}
}
