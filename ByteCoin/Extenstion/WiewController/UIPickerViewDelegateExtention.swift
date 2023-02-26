import UIKit
extension ViewController : UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager?.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       
        if let curreny = coinManager?.currencyArray[row]{
            coinManager?.GetPrice(currency: curreny)
        }
    }

}
