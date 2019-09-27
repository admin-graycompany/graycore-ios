import XCTest
@testable import GrayCore
@testable import GrayCore_Example

class CustomErrorTests: XCTestCase {

	func testCustomError() {
		let text = "This is a custom error"
		let error: Error = CustomError(message: text)
		XCTAssertEqual(text, error.localizedDescription)
	}
}
