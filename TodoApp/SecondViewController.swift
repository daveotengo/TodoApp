//
//  SecondViewController.swift
//  TodoApp
//
//  Created by David Oteng on 18/02/2021.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textFld: UITextField!
    var arrVals : [String]  = []
    @IBAction func btn(_ sender: Any) {
        
        if let txFldVal = textFld.text {
            
            arrVals.append(txFldVal)
            UserDefaults.standard.setValue(arrVals, forKey: "aItem")

        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
