import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        let label = UILabel()
        label.text = "Hello World!"
        label.textAlignment = .center
        label.backgroundColor = .white
        view = label
    }

}
