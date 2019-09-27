import XCTest
@testable import GrayCore

class ViewModelTests: XCTestCase {
	
	override func setUp() {
		continueAfterFailure = false
	}
}

// MARK: - Set Data
extension ViewModelTests {
	
	func testSetInt() {
		let controller = Controller<Int>()
		controller.viewModel.set(data: 12)
		XCTAssertEqual(controller.result, 12)
		controller.viewModel.set(data: 32)
		XCTAssertEqual(controller.result, 32)
	}
	
	func testSetString() {
		let controller = Controller<String>()
		controller.viewModel.set(data: "check")
		XCTAssertEqual(controller.result, "check")
		controller.viewModel.set(data: "test")
		XCTAssertEqual(controller.result, "test")
	}
	
	func testSetStruct() {
		let controller = Controller<StructCar>()
		var car = StructCar(model: "Boxster", year: 2019)
		controller.viewModel.set(data: car)
		XCTAssertEqual(controller.result?.model, car.model)
		XCTAssertEqual(controller.result?.year, car.year)
		car = StructCar(model: "Panamera", year: 2016)
		controller.viewModel.set(data: car)
		XCTAssertEqual(controller.result?.model, car.model)
		XCTAssertEqual(controller.result?.year, car.year)
	}
	
	func testSetClass() {
		let controller = Controller<ClassCar>()
		var car = ClassCar(model: "Boxster", year: 2019)
		controller.viewModel.set(data: car)
		XCTAssertEqual(controller.result?.model, car.model)
		XCTAssertEqual(controller.result?.year, car.year)
		car = ClassCar(model: "Panamera", year: 2016)
		controller.viewModel.set(data: car)
		XCTAssertEqual(controller.result?.model, car.model)
		XCTAssertEqual(controller.result?.year, car.year)
	}
}

// MARK: - Update Data
extension ViewModelTests {
	
	func testUpdateInt() {
		let controller = Controller<Int>()
		controller.viewModel.set(data: 10)
		XCTAssertEqual(controller.result, 10)
		controller.viewModel.update { _ in 15 }
		XCTAssertEqual(controller.result, 15)
	}
	
	func testUpdateString() {
		let controller = Controller<String>()
		controller.viewModel.set(data: "car")
		XCTAssertEqual(controller.result, "car")
		controller.viewModel.update { _ in "plane" }
		XCTAssertEqual(controller.result, "plane")
	}
	
	func testUpdateStruct() {
		let controller = Controller<StructCar>()
		let obj = StructCar(model: "Cayman", year: 2017)
		controller.viewModel.set(data: obj)
		XCTAssertEqual(controller.result?.model, obj.model)
		XCTAssertEqual(controller.result?.year, obj.year)
		controller.viewModel.update { car in
			var car = car
			car?.year = 2018
			return car
		}
		XCTAssertEqual(controller.result?.model, obj.model)
		XCTAssertEqual(controller.result?.year, 2018)
	}
	
	func testUpdateClass() {
		let controller = Controller<ClassCar>()
		let obj = ClassCar(model: "Macan", year: 2019)
		controller.viewModel.set(data: obj)
		XCTAssertEqual(controller.result?.model, obj.model)
		XCTAssertEqual(controller.result?.year, obj.year)
		controller.viewModel.update { car in
			car?.year = 2018
		}
		XCTAssertEqual(controller.result?.model, obj.model)
		XCTAssertEqual(controller.result?.year, 2018)
	}
}

// MARK: - Test Helpers
private class Controller<T> {
	
	var viewModel: ViewModel<T> = ViewModel()
	var result: T?
	var count = 0
	
	init() {
		viewModel.bind { result in
			self.result = result
			self.count += 1
		}
	}
}

private struct StructCar {
	var model: String
	var year: Int
}

private class ClassCar {
	var model: String
	var year: Int
	init(model: String, year: Int) {
		self.model = model
		self.year = year
	}
}
