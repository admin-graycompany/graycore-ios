import Foundation

extension Validator {
	
	/// Check if the Phone number is valid or not. For the range parameters, you should use a single digit or two digits split by comma: "2" will search for 2 digits; "1,3" will search for 1 to 3 digits inclusive
	///
	/**
	```
	let result = Validator.isValid(
		phone: "+55 (51) 98888-7777",
		formatted: true,
		internationalNumber: true,
		areaCodeRange: String = "2",
		leftRange: String = "4,5",
		rightRange: String = "4"
	)
	print(result) // true
	```
	*/
	/// - Parameters:
	///   - phone: Phone string
	///   - formatted: Should be formatted or not, default is true
	///   - internationalNumber: Should test country code, default is false
	///   - areaCodeRange: Range of the area, default is "2"
	///   - leftRange: Range of the left side, default is "4,5"
	///   - rightRange: Range of the Right side, default is "4"
	/// - Returns: Boolean indicating if it is valid or not
	public static func isValid(phone: String,
							   formatted: Bool = true,
							   internationalNumber: Bool = false,
							   areaCodeRange: String = "2",
							   leftRange: String = "4,5",
							   rightRange: String = "4") -> Bool {
		var regEx = "^"
		if internationalNumber {
			regEx += "[+]?[\\d]{1,2}"
			if formatted {
				regEx += "\\s"
			}
		}
		if formatted {
			regEx += "\\("
		}
		regEx += "[\\d]{\(areaCodeRange)}"
		if formatted {
			regEx += "\\)\\s"
		}
		regEx += "[\\d]{\(leftRange)}"
		if formatted {
			regEx += "-"
		}
		regEx += "[\\d]{\(rightRange)}$"
		let predicate = NSPredicate(format: "SELF MATCHES %@", regEx)
		return predicate.evaluate(with: phone)
	}
}
