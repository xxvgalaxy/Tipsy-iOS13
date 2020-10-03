import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var valueTip: Float?
    var result: Float = 0.0
    var tipText: String?
    
    @IBAction func tipChanged(_ sender: UIButton) {
        tipText = String(sender.currentTitle ?? "0%")
        var trimTip = String(sender.currentTitle ?? "0%")
        trimTip.removeLast()
        valueTip = Float(trimTip)! / Float(100)
        
        if  valueTip == 0.0 {
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
        } else if valueTip == 0.1 {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
        } else if valueTip == 0.2 {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
        }
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = Int(sender.value).description
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = Float(billTextField.text ?? "0.0")
        let splitNumber = Float(splitNumberLabel.text ?? "0.0")
        result = (bill! + (bill! * valueTip!) ) / splitNumber!
        self.performSegue(withIdentifier: "resultSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ResultViewController
        destinationVC.result = result
        destinationVC.tip = tipText
        destinationVC.numberSplit = Int(splitNumberLabel.text!)!
    }
}

