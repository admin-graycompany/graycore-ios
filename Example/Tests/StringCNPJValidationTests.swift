import XCTest
@testable import GrayCore

class StringCNPJValidationTests: XCTestCase {
	
	func testEmptyCNPJ() {
		XCTAssertFalse("".isValidCNPJ)
	}
	
	func testAlphanumericCNPJ() {
		XCTAssertFalse("abcde".isValidCNPJ)
		XCTAssertFalse("abc.111.def-11".isValidCNPJ)
		XCTAssertFalse("111abc111de".isValidCNPJ)
	}
	
	func testInvalidSizeCNPJ() {
		XCTAssertFalse("12345".isValidCNPJ)
		XCTAssertFalse("12345678901234567890".isValidCNPJ)
	}
	
	func testUnrealCNPJ() {
		XCTAssertFalse("22.222.222/2222-22".isValidCNPJ)
		XCTAssertFalse("22222222222222".isValidCNPJ)
	}
	
	func testInvalidCNPJ() {
		XCTAssertFalse("12.345.678/9012-34".isValidCNPJ)
		XCTAssertFalse("12345678901234".isValidCNPJ)
	}
	
	func testValidCNPJ() {
		XCTAssertTrue("25559813000147".isValidCNPJ)
		XCTAssertTrue("25.559.813/0001-47".isValidCNPJ)
		XCTAssertTrue("76702537000165".isValidCNPJ)
		XCTAssertTrue("76.702.537/0001-65".isValidCNPJ)
		XCTAssertTrue("92974201000108".isValidCNPJ)
		XCTAssertTrue("92.974.201/0001-08".isValidCNPJ)
		XCTAssertTrue("99047409000120".isValidCNPJ)
		XCTAssertTrue("99.047.409/0001-20".isValidCNPJ)
		XCTAssertTrue("69458488000100".isValidCNPJ)
		XCTAssertTrue("69.458.488/0001-00".isValidCNPJ)
	}
}
