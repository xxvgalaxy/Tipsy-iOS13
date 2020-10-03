import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    var result: Float?
    var tip: String?
    var numberSplit: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(result!)
        settingsLabel.text = "Split between \(numberSplit!) people, with \(tip!) tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
