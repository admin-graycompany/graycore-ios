# GrayCore

[![CI Status](https://travis-ci.com/admin-graycompany/graycore-ios.svg?branch=master)](https://travis-ci.com/admin-graycompany/graycore-ios.svg?branch=master)
[![Version](https://img.shields.io/cocoapods/v/GrayCore.svg?style=flat)](https://cocoapods.org/pods/GrayCore)
[![License](https://img.shields.io/cocoapods/l/GrayCore.svg?style=flat)](https://cocoapods.org/pods/GrayCore)
[![Platform](https://img.shields.io/cocoapods/p/GrayCore.svg?style=flat)](https://cocoapods.org/pods/GrayCore)

## Installation

GrayCore is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'GrayCore'
```

## Usage

### CustomError

This is a very simple, yet helpful, error with a string.

```swift
let error: Error = CustomError(message: "Error description")
print(error.localizedDescription)
```

### Formatter

Formatter is a class with static methods to format data.

#### Phone

The phone formatter will get a string, remove all non numeric characters and return the result formatted.

```swift
var result = Formatter.format(phone: "11988887777")
print(result) // "(11) 98888-7777"

result = Formatter.format(
	phone: "551188887777", 
	addPlusSign: true, 
	countryCodeDigits: 2, 
	areaCodeDigits: 2,
	leftDigits: 4,
	rightDigits: 4
)
print(result) // "+55 (11) 8888-7777"
```

### Router

The Router can instantiate the initial view controller from  a Storyboard file. Because it use generics, it will try to cast it with the informed class type.

```swift
let router = Router()
let path = RouterPath(rawValue: "Scene")
let destination: SceneViewController? = router.destination(for: path)
```

The RouterPath is the component that has the Storyboard name and it can be easily extended for a better code:

```swift
extension RouterPath {
	public static var Scene: RouterPath {
		return RouterPath(rawValue: "Scene")
	}
}

let router = Router()
let destination: SceneViewController? = router.destination(for: .Scene)
```

### Validator

Validator is a class with static methods to validate data.

#### Email

```swift
let result = Validator.isValid(email: "balu.gray-10+app@graycompany.com.br")
print(result) // true
```

#### Phone

```swift
var result = Validator.isValid(phone: "(11) 98888-7777")
print(result) // true

result = Validator.isValid(
	phone: "+55 (11) 8888-7777",
	formatted: true,
	internationalNumber: true,
	areaCodeRange: "2",
	leftRange: "4,5",
	rightRange: "4"
)
print(result) // true
```

## ViewModel

The ViewModel class was designed to be simple but very flexible and powerful. It has only 3 methods: 

* bind(_ listener: @escaping (T?) -> Void)
* set(data: T?)
* update(block: (T?) -> T?)

### Bind

Use bind to set a closure that will be executed everytime new data is set on the ViewModel. It will call with the data itself as the parameter.

### Set

This is used to substitute the current data on the ViewModel. After updating the property, it will fire the bind method.

### Update

If you want to change just a few properties instead of the whole object, you can call update and it will give you a closure with the data as the parameter. With that, you just need to change what you need and then the ViewModel will fire the bind method.

### Example

```swift
import UIKit
import GrayCore

class Counter {
	var title: String
	var currentValue: Int
	init(title: String, currentValue: Int) {
		self.title = title
		self.currentValue = currentValue
	}
}

class ViewController: UIViewController {

	var viewModel: ViewModel<Counter> = ViewModel()
	
	@IBOutlet private weak var titleLabel: UILabel!
	@IBOutlet private weak var currentValueLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		viewModel.bind { counter in
			self.updateUI(counter: counter)
		}
		updateUI(counter: nil)
	}
	
	func updateUI(counter: Counter?) {
		let empty = "-"
		titleLabel.text = counter?.title ?? empty
		var value = empty
		if let currentValue = counter?.currentValue {
			value = "\(currentValue)"
		}
		currentValueLabel.text = value
	}
	
	@IBAction private func resetButtonTouchUpInside(_ sender: UIButton) {
		viewModel.set(data: Counter(title: "Counter", currentValue: 0))
	}
	
	@IBAction private func incrementButtonTouchUpInside(_ sender: UIButton) {
		viewModel.update { counter in
			counter?.currentValue += 1
		}
	}
	
	@IBAction private func decrementButtonTouchUpInside(_ sender: UIButton) {
		viewModel.update { counter in
			counter?.currentValue -= 1
		}
	}
}
```

## Author

Gray Company <contato@graycompany.com.br>

## License

GrayCore is available under the MIT license. See the LICENSE file for more info.
