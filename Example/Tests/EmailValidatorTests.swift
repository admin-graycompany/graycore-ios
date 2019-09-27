import XCTest
@testable import GrayCore

class EmailValidatorTests: XCTestCase {

	// MARK: - Valid Emails
	
	func testValidSimpleEmail() {
		XCTAssertTrue(Validator.isValid(email: "balu@mail.com"))
	}
	
	func testValidComplexEmail() {
		XCTAssertTrue(Validator.isValid(email: "balu.gray-10+app@mail.co.uk"))
	}
	
	func testValidCaseSensitiveEmail() {
		XCTAssertTrue(Validator.isValid(email: "Balu.Gray@graycompany.com.br"))
	}
	
	// MARK: - Invalid Emails
	
	func testInvalidEmptyEmail() {
		XCTAssertFalse(Validator.isValid(email: ""))
	}
	
	func testInvalidNoAt() {
		XCTAssertFalse(Validator.isValid(email: "balumail.com"))
	}
	
	func testInvalidNoName() {
		XCTAssertFalse(Validator.isValid(email: "@mail.com"))
	}
	
	func testInvalidNoServer() {
		XCTAssertFalse(Validator.isValid(email: "balu@"))
	}
	
	func testInvalidNoExtension() {
		XCTAssertFalse(Validator.isValid(email: "balu@mail"))
	}
	
	func testInvalidOnlyNumbers() {
		XCTAssertFalse(Validator.isValid(email: "1234"))
	}
	
	func testInvalidShortEmail() {
		XCTAssertFalse(Validator.isValid(email: "a@b.c"))
	}
	
	func testInvalidPrefix() {
		XCTAssertFalse(Validator.isValid(email: "ops balu@graycompany.com.br"))
	}
	
	func testInvalidSuffix() {
		XCTAssertFalse(Validator.isValid(email: "balu@graycompany.com.br ops"))
	}
}
