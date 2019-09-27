import Foundation

extension Validator {
	
	/// Check if an Email is valid or not
	///
	/// - Parameter email: String to be analyzed
	/// - Returns: Valid or not
	public static func isValid(email: String) -> Bool {
		let regEx = "[A-z0-9._%+-]+@[A-z0-9.-]+\\.[A-z]{2,64}"
		let predicate = NSPredicate(format: "SELF MATCHES %@", regEx)
		return predicate.evaluate(with: email)
	}
}

