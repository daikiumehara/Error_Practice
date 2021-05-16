//
//  ViewController.swift
//  Error_Practice
//
//  Created by daiki umehara on 2021/05/15.
//

import UIKit

enum CalcError: Error {
    case notNumber
    case noneValue
    case differentType
}

class ViewController: UIViewController {

    @IBOutlet private var value1TextField: UITextField!
    @IBOutlet private var value2TextField: UITextField!
    @IBOutlet private var answerLabel: UILabel!
    @IBOutlet var alertLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction private func buttonDidTapped(_ sender: Any) {
        do {
            let value = try add(value1: value1TextField.text!,
                                value2: value2TextField.text!)
            answerLabel.text = "\(value)"
            alertLabel.text = "正しく計算ができたぞ"
        } catch CalcError.notNumber {
            alertLabel.text = "数字じゃないものは計算できんぞ"
        } catch CalcError.differentType {
            alertLabel.text = "少数と整数は同時に計算できんぞ"
        } catch CalcError.noneValue {
            alertLabel.text = "値を入力するんだ"
        } catch {
            alertLabel.text = "予想外のエラーだ"
        }
    }
    
    func add(value1: String, value2: String) throws -> Any {
        if value1.isEmpty || value2.isEmpty {
            throw CalcError.noneValue
        }
        guard Double(value1) != nil else { throw CalcError.notNumber }
        guard Double(value2) != nil else { throw CalcError.notNumber }
        if Int(value1) != nil, Int(value2) != nil {
            return Int(value1)! + Int(value2)!
        } else if Int(value1) == nil, Int(value2) == nil {
            return Double(value1)! + Double(value2)!
        } else {
            throw CalcError.differentType
        }
    }
}
