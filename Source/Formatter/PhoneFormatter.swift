import Foundation

extension Formatter {
	
	public static func format(phone: String,
					   addPlusSign: Bool = false,
					   countryCodeDigits: Int = 0,
					   areaCodeDigits: Int = 2,
					   leftDigits: Int = 5,
					   rightDigits: Int = 4) -> String? {
		guard !phone.isEmpty else { return nil }
		var size = (countryCodeDigits + areaCodeDigits + leftDigits + rightDigits)
		var digits: [String] = phone.components(separatedBy: CharacterSet.decimalDigits.inverted).joined().map { String($0) }
		guard digits.count == size else { return nil }
		if rightDigits > 0 {
			size -= rightDigits
			digits.insert("-", at: size)
		}
		if leftDigits > 0 {
			size -= leftDigits
		}
		if areaCodeDigits > 0 {
			digits.insert(" ", at: size)
			digits.insert(")", at: size)
			size -= areaCodeDigits
			digits.insert("(", at: size)
		}
		if countryCodeDigits > 0 {
			digits.insert(" ", at: size)
			size -= countryCodeDigits
			if addPlusSign {
				digits.insert("+", at: size)
			}
		}
		return digits.joined()
	}
}
