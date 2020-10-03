import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var valueTip: Float?
   
    @IBAction func tipChanged(_ sender: UIButton) {
        var tipText = String(sender.currentTitle ?? "0%")
        tipText.removeLast()
        valueTip = Float(tipText)! / Float(100)
        
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
        
        
        
        print(splitNumberLabel.text!)
    }
}

