# GrayCore

[![CI Status](https://img.shields.io/travis/admin-graycompany/GrayCore.svg?style=flat)](https://travis-ci.org/admin-graycompany/GrayCore)
[![Version](https://img.shields.io/cocoapods/v/GrayCore.svg?style=flat)](https://cocoapods.org/pods/GrayCore)
[![License](https://img.shields.io/cocoapods/l/GrayCore.svg?style=flat)](https://cocoapods.org/pods/GrayCore)
[![Platform](https://img.shields.io/cocoapods/p/GrayCore.svg?style=flat)](https://cocoapods.org/pods/GrayCore)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

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

## Author

Gray Company

## License

GrayCore is available under the MIT license. See the LICENSE file for more info.
