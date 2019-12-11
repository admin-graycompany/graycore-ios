import XCTest
import PhoneNumberKit
@testable import GrayCore

class StringPhoneValidationTests: XCTestCase {
	
	func testValidFormat() {
		let region = "BR"
		let phone = "(51) 98888-7777"
		XCTAssertTrue(phone.isValidPhone(region: region))
		
		let phoneNumber = phone.phoneNumber(region: region)
		XCTAssertNotNil(phoneNumber)
		XCTAssertEqual(phoneNumber?.countryCode, 55)
		XCTAssertEqual(phoneNumber?.nationalNumber, 51988887777)
		XCTAssertEqual(phoneNumber?.numberString, phone)
		XCTAssertEqual(phoneNumber?.regionID, region)
		
		let phoneNumberKit = PhoneNumberKit()
		XCTAssertEqual(phoneNumberKit.format(phoneNumber!, toType: .national), "(51) 98888-7777")
	}
	
	func testOnlyNumbers() {
		let region = "BR"
		let phone = "51988887777"
		XCTAssertTrue(phone.isValidPhone(region: region))
		
		let phoneNumber = phone.phoneNumber(region: region)
		XCTAssertNotNil(phoneNumber)
		XCTAssertEqual(phoneNumber?.countryCode, 55)
		XCTAssertEqual(phoneNumber?.nationalNumber, 51988887777)
		XCTAssertEqual(phoneNumber?.numberString, phone)
		XCTAssertEqual(phoneNumber?.regionID, region)
		
		let phoneNumberKit = PhoneNumberKit()
		XCTAssertEqual(phoneNumberKit.format(phoneNumber!, toType: .national), "(51) 98888-7777")
	}
	
	func testInvalidRegion() {
		let region = "OPS"
		let phone = "51988887777"
		XCTAssertFalse(phone.isValidPhone(region: region))
		let phoneNumber = phone.phoneNumber(region: region)
		XCTAssertNil(phoneNumber)
	}
	
	func testInvalidNumber() {
		let region = "BR"
		let phone = "NUMBER"
		XCTAssertFalse(phone.isValidPhone(region: region))
		let phoneNumber = phone.phoneNumber(region: region)
		XCTAssertNil(phoneNumber)
	}
}
