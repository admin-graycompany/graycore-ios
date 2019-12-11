import Foundation
import PhoneNumberKit

extension String {
	
	public func phoneNumber(region: String) -> PhoneNumber? {
		let phoneNumberKit = PhoneNumberKit()
		return try? phoneNumberKit.parse(self, withRegion: region, ignoreType: true)
	}
	
	public func isValidPhone(region: String) -> Bool {
		return phoneNumber(region: region) != nil
	}
}
