//
//  DecryptViewController.swift
//  cesarCipher
//
//  Created by user168602 on 3/16/20.
//  Copyright © 2020 stx. All rights reserved.
//

import UIKit

class DecryptViewController: UIViewController {

    @IBOutlet weak var plainTextField: UITextField!
    
    @IBOutlet weak var shiftTextFIeld: UITextField!
    
    @IBOutlet weak var outputLabel: UILabel!
    
    let plainAlphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z", "A", "B", "C", "D", "E", ",F", "G", "H", "I", "J", "K", "L", "M", "N" ,"O", "P", "Q", "R", "S", "T", "U", "V", "W" ,"X", "Y", "Z", "0", "1", "2", "3", "4", "5" ,"6", "7", "8", "9"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
        func generateCipherAlphabet(shift:Int)->[String]
    {
        var newPlainAlphabet = plainAlphabet
        
        for _ in 0...shift-1
        {
            newPlainAlphabet.append(newPlainAlphabet.remove(at: 0))
        }
        //add code here, you may find it useful to review arrays here: https://www.weheartswift.com/arrays/
        return newPlainAlphabet
    }
    
    func cesarDecrypt(message plainText: String, cesarShift: Int)->String
    {
        let cipherAlphabet = generateCipherAlphabet(shift: plainAlphabet.count - cesarShift)
        var cipherText = ""
        if cesarShift < 0
        {
            print("Shift must be positive")
            return plainText
        }
        for letter in plainText
        {
            let letterIndex = plainAlphabet.firstIndex(of: String(letter))
            if letterIndex == nil
            {
                cipherText = cipherText + String(letter)
            }
            else{
                cipherText = cipherText + cipherAlphabet[letterIndex!]
            }
     
        }
        return cipherText
    }

    
    
    @IBAction func decryptButton(_ sender: Any) {
         let plainText = plainTextField.text ?? ""
               let shiftText = Int(shiftTextFIeld.text ?? "0")
               let decryptedMsg = cesarDecrypt(message: plainText, cesarShift: shiftText!)
               outputLabel.text = decryptedMsg    }
    
    
   
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
