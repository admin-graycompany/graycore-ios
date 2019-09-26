import XCTest
@testable import GrayCore
@testable import GrayCore_Example

class RouterTests: XCTestCase {
	
	func testInstantiateWithString() {
		let router = Router()
		let path = RouterPath(rawValue: "Scene")
		let destination: SceneViewController? = router.destination(for: path)
		XCTAssertNotNil(destination)
	}
	
	func testInstantiateWithStaticValue() {
		let router = Router()
		let destination: SceneViewController? = router.destination(for: .Scene)
		XCTAssertNotNil(destination)
	}
}
