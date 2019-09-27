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

