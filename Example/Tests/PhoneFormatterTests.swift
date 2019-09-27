import XCTest
@testable import GrayCore

class PhoneFormatterTests: XCTestCase {

	func testEmptyString() {
		let result = Formatter.format(phone: "")
		XCTAssertNil(result)
	}
	
	func testInvalidSize() {
		let result = Formatter.format(phone: "123")
		XCTAssertNil(result)
	}
	
	func testInvalidCharacters() {
		let result = Formatter.format(phone: "a1b2c3d4c5d")
		XCTAssertNil(result)
	}
	
	func test9DigitsPhoneWithoutCountryCode() {
		let expectation = "(11) 98888-7777"
		var result = Formatter.format(phone: "11988887777")
		XCTAssertEqual(result, expectation)
		result = Formatter.format(phone: expectation)
		XCTAssertEqual(result, expectation)
	}
	
	func test8DigitsPhoneWithoutCountryCode() {
		let expectation = "(11) 8888-7777"
		var result = Formatter.format(phone: "1188887777", leftDigits: 4)
		XCTAssertEqual(result, expectation)
		result = Formatter.format(phone: expectation, leftDigits: 4)
		XCTAssertEqual(result, expectation)
	}
	
	func test9DigitsPhoneWithCountryCodeWithoutPlus() {
		let expectation = "55 (11) 98888-7777"
		var result = Formatter.format(phone: "5511988887777", countryCodeDigits: 2)
		XCTAssertEqual(result, expectation)
		result = Formatter.format(phone: expectation, countryCodeDigits: 2)
		XCTAssertEqual(result, expectation)
	}
	
	func test8DigitsPhoneWithCountryCodeWithoutPlus() {
		let expectation = "55 (11) 8888-7777"
		var result = Formatter.format(phone: "551188887777", countryCodeDigits: 2, leftDigits: 4)
		XCTAssertEqual(result, expectation)
		result = Formatter.format(phone: expectation, countryCodeDigits: 2, leftDigits: 4)
		XCTAssertEqual(result, expectation)
	}
	
	func test9DigitsPhoneWithCountryCodeWithPlus() {
		let expectation = "+55 (11) 98888-7777"
		var result = Formatter.format(phone: "+5511988887777", addPlusSign: true, countryCodeDigits: 2)
		XCTAssertEqual(result, expectation)
		result = Formatter.format(phone: expectation, addPlusSign: true, countryCodeDigits: 2)
		XCTAssertEqual(result, expectation)
	}
	
	func test8DigitsPhoneWithCountryCodeWithPlus() {
		let expectation = "+55 (11) 8888-7777"
		var result = Formatter.format(phone: "+551188887777", addPlusSign: true, countryCodeDigits: 2, leftDigits: 4)
		XCTAssertEqual(result, expectation)
		result = Formatter.format(phone: expectation, addPlusSign: true, countryCodeDigits: 2, leftDigits: 4)
		XCTAssertEqual(result, expectation)
	}
	
	func test9DigitsPhoneWithoutCountryCodeWithoutAreaCode() {
		let expectation = "98888-7777"
		var result = Formatter.format(phone: "988887777", areaCodeDigits: 0)
		XCTAssertEqual(result, expectation)
		result = Formatter.format(phone: expectation, areaCodeDigits: 0)
		XCTAssertEqual(result, expectation)
	}
}
