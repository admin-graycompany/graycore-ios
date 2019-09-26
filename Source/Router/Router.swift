import UIKit

/// Implementation of the RouterProtocol using Storyboards
public class Router {
	public init() {}
	
	/// Instantiates the initial view controller of the given storyboard path
	///
	/// - Parameter path: Name of the storyboard
	/// - Returns: Destination view controller
	private func instantiateVC(for path: String) -> UIViewController? {
		let storyboard = UIStoryboard(name: path, bundle: nil)
		return storyboard.instantiateInitialViewController()
	}
}

// MARK: - RouterProtocol
extension Router: RouterProtocol {
	
	public func destination<T: UIViewController>(for path: RouterPath) -> T? {
		let destinationVC = instantiateVC(for: path.rawValue)
		return destinationVC as? T
	}
}
