import XCTest
@testable import GrayCore

class StringCPFValidationTests: XCTestCase {

	func testEmptyCPF() {
		XCTAssertFalse("".isValidCPF)
	}
	
	func testAlphanumericCPF() {
		XCTAssertFalse("abcde".isValidCPF)
		XCTAssertFalse("abc.111.def-11".isValidCPF)
		XCTAssertFalse("111abc111de".isValidCPF)
	}
	
	func testInvalidSizeCPF() {
		XCTAssertFalse("12345".isValidCPF)
		XCTAssertFalse("12345678901234567890".isValidCPF)
	}
	
	func testUnrealCPF() {
		XCTAssertFalse("111.111.111-11".isValidCPF)
		XCTAssertFalse("11111111111".isValidCPF)
	}
	
	func testInvalidCPF() {
		XCTAssertFalse("123.456.789-10".isValidCPF)
		XCTAssertFalse("12345678910".isValidCPF)
	}
	
	func testValidCPF() {
		XCTAssertTrue("55560630012".isValidCPF)
		XCTAssertTrue("555.606.300-12".isValidCPF)
		XCTAssertTrue("67643466076".isValidCPF)
		XCTAssertTrue("676.434.660-76".isValidCPF)
		XCTAssertTrue("75367533060".isValidCPF)
		XCTAssertTrue("753.675.330-60".isValidCPF)
		XCTAssertTrue("88658504000".isValidCPF)
		XCTAssertTrue("886.585.040-00".isValidCPF)
	}
}
