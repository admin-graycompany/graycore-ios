import Foundation

extension Validator {
	
	/// Check if a CPF is valid or not
	///
	/// - Parameter email: String to be analyzed
	/// - Returns: Valid or not
	public static func isValid(cpf: String) -> Bool {
		guard !cpf.isEmpty else { return false }
		let digits: [String] = cpf.components(separatedBy: CharacterSet.decimalDigits.inverted).joined().map { String($0) }
		guard digits.count == 11 else { return false }
		
		var uniqueValues: [String: Bool] = [:]
		_ = digits.map { digit in
			uniqueValues[digit] = true
		}
		guard uniqueValues.keys.count > 1 else { return false }
		
		let validationDigit1 = Int(digits[9])
		let validationDigit2 = Int(digits[10])
		var resultingDigit1 = 0
		var resultingDigit2 = 0
		
		for i in 0..<9 {
			let char = Int(digits[i])!
			resultingDigit1 += char * (10 - i)
			resultingDigit2 += char * (11 - i)
		}
		
		resultingDigit1 %= 11
		resultingDigit1 = resultingDigit1 < 2 ? 0 : 11 - resultingDigit1
		
		resultingDigit2 += resultingDigit1 * 2
		resultingDigit2 %= 11
		resultingDigit2 = resultingDigit2 < 2 ? 0 : 11 - resultingDigit2
		
		return resultingDigit1 == validationDigit1 && resultingDigit2 == validationDigit2
	}
}
