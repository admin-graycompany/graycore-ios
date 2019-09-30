import XCTest
@testable import GrayCore

class CPFValidatorTests: XCTestCase {

	func testEmptyCPF() {
		XCTAssertFalse(Validator.isValid(cpf: ""))
	}
	
	func testAlphanumericCPF() {
		XCTAssertFalse(Validator.isValid(cpf: "abcde"))
		XCTAssertFalse(Validator.isValid(cpf: "abc.111.def-11"))
		XCTAssertFalse(Validator.isValid(cpf: "111abc111de"))
	}
	
	func testInvalidSizeCPF() {
		XCTAssertFalse(Validator.isValid(cpf: "12345"))
		XCTAssertFalse(Validator.isValid(cpf: "12345678901234567890"))
	}
	
	func testUnrealCPF() {
		XCTAssertFalse(Validator.isValid(cpf: "111.111.111-11"))
		XCTAssertFalse(Validator.isValid(cpf: "11111111111"))
	}
	
	func testInvalidCPF() {
		XCTAssertFalse(Validator.isValid(cpf: "123.456.789-10"))
		XCTAssertFalse(Validator.isValid(cpf: "12345678910"))
	}
	
	func testValidCPF() {
		XCTAssertTrue(Validator.isValid(cpf: "12345678909"))
		XCTAssertTrue(Validator.isValid(cpf: "123.456.789-09"))
		XCTAssertTrue(Validator.isValid(cpf: "555.606.300-12"))
		XCTAssertTrue(Validator.isValid(cpf: "676.434.660-76"))
		XCTAssertTrue(Validator.isValid(cpf: "753.675.330-60"))
		XCTAssertTrue(Validator.isValid(cpf: "886.585.040-00"))
	}
}
