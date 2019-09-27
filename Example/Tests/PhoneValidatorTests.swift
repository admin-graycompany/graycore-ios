import XCTest
@testable import GrayCore

class PhoneValidatorTests: XCTestCase {
	
	// MARK: - Test Suite
	
	private func doTests(whiteList: [String],
				 formatted: Bool,
				 internationalNumber: Bool,
				 areaCodeRange: String,
				 leftRange: String,
				 rightRange: String) {
		let testList: [String] = [
			"5188887777",
			"51988887777",
			"151888777",
			"1518887777",
			"1518888777",
			"15188887777",
			
			"(51) 8888-7777",
			"(51) 98888-7777",
			"(151) 888-777",
			"(151) 888-7777",
			"(151) 8888-777",
			"(151) 8888-7777",
			
			"555188887777",
			"5551988887777",
			"55151888777",
			"551518887777",
			"551518888777",
			"5515188887777",
			
			"55 (51) 8888-7777",
			"55 (51) 98888-7777",
			"55 (151) 888-777",
			"55 (151) 888-7777",
			"55 (151) 8888-777",
			"55 (151) 8888-7777",
			
			"+555188887777",
			"+5551988887777",
			"+55151888777",
			"+551518887777",
			"+551518888777",
			"+5515188887777",
			
			"+55 (51) 8888-7777",
			"+55 (51) 98888-7777",
			"+55 (151) 888-777",
			"+55 (151) 888-7777",
			"+55 (151) 8888-777",
			"+55 (151) 8888-7777",
		]
		for phone in testList {
			let isValid = Validator.isValid(
				phone: phone,
				formatted: formatted,
				internationalNumber: internationalNumber,
				areaCodeRange: areaCodeRange,
				leftRange: leftRange,
				rightRange: rightRange
			)
			if whiteList.contains(phone), !isValid {
				XCTFail("Item \(phone) is in the white list but is not valid")
			}
			if !whiteList.contains(phone), isValid {
				XCTFail("Item \(phone) is in not the white list but is valid")
			}
		}
	}

	// MARK: - Tests
	
	func testDefaultFormat() {
		XCTAssertTrue(Validator.isValid(phone: "(55) 8888-7777"))
		XCTAssertTrue(Validator.isValid(phone: "(55) 98888-7777"))
	}
	
	func testNotFormattedNotInternationalPhone() {
		doTests(
			whiteList: [
				"5188887777",
				"51988887777",
				"151888777",
				"1518887777",
				"1518888777",
				"15188887777",
				"555188887777",
				"55151888777",
				"551518887777",
				"551518888777",
			],
			formatted: false,
			internationalNumber: false,
			areaCodeRange: "2,3",
			leftRange: "3,5",
			rightRange: "3,4"
		)
	}
	
	func testFormattedNotInternationalPhone() {
		doTests(
			whiteList: [
				"(51) 8888-7777",
				"(51) 98888-7777",
				"(151) 888-777",
				"(151) 888-7777",
				"(151) 8888-777",
				"(151) 8888-7777",
			],
			formatted: true,
			internationalNumber: false,
			areaCodeRange: "2,3",
			leftRange: "3,5",
			rightRange: "3,4"
		)
	}
	
	func testNotFormattedInternationalPhone() {
		doTests(
			whiteList: [
				"5188887777",
				"51988887777",
				"151888777",
				"1518887777",
				"1518888777",
				"15188887777",
				"555188887777",
				"5551988887777",
				"55151888777",
				"551518887777",
				"551518888777",
				"5515188887777",
				"+555188887777",
				"+5551988887777",
				"+55151888777",
				"+551518887777",
				"+551518888777",
				"+5515188887777"
			],
			formatted: false,
			internationalNumber: true,
			areaCodeRange: "2,3",
			leftRange: "3,5",
			rightRange: "3,4"
		)
	}
	
	func testFormattedInternationalPhone() {
		doTests(
			whiteList: [
				"55 (51) 8888-7777",
				"55 (51) 98888-7777",
				"55 (151) 888-777",
				"55 (151) 888-7777",
				"55 (151) 8888-777",
				"55 (151) 8888-7777",
				"+55 (51) 8888-7777",
				"+55 (51) 98888-7777",
				"+55 (151) 888-777",
				"+55 (151) 888-7777",
				"+55 (151) 8888-777",
				"+55 (151) 8888-7777",
			],
			formatted: true,
			internationalNumber: true,
			areaCodeRange: "2,3",
			leftRange: "3,5",
			rightRange: "3,4"
		)
	}
}
