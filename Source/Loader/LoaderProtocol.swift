import Foundation

/// Protocol to show or hide a loader (i.e.: Activity Indicator on top of everything)
protocol LoaderProtocol {
	
	/// Shows the Loader scene
	func showLoader()
	
	/// Hides the Loader scene
	func hideLoader()
}
