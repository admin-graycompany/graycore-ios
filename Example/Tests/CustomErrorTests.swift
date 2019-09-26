import XCTest
@testable import GrayCore

class CustomErrorTests: XCTestCase {

	func testCustomError() {
		let text = "This is a custom error"
		let error: Error = CustomError(message: text)
		XCTAssertEqual(text, error.localizedDescription)
	}
}
