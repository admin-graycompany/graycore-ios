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
			guard let counter = counter else { return }
			self.updateUI(counter: counter)
		}
		viewModel.set(data: Counter(title: "Counter", currentValue: 0))
	}
	
	func updateUI(counter: Counter) {
		titleLabel.text = counter.title
		currentValueLabel.text = "\(counter.currentValue)"
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

