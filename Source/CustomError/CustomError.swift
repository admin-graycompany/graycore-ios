import Foundation

/// General custom error
public struct CustomError: Error, Equatable {
	
	/// Code from the server if available
	public let code: Int?
	
	/// Message detailing the error
	public let message: String
	
	/// Status
	public let status: Int?
	
	public init(code: Int? = nil, message: String, status: Int? = nil) {
		self.code = code
		self.message = message
		self.status = status
	}
}

// MARK: - LocalizedError
extension CustomError: LocalizedError {
	
	public var errorDescription: String? {
		return message
	}
}
