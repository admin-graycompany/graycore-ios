import UIKit
import GrayCore

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		let router = Router()
		let destination: SceneViewController? = router.destination(for: .Scene)
		print(destination?.test ?? "")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

