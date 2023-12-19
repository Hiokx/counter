//
//  ViewController.swift
//  counter
//
//  Created by Никита Подошвелев on 19.12.2023.
//

import UIKit
import Foundation
let currentDate = Date()
let dateFormatter = DateFormatter()
class ViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusBotton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var textResult: UITextView!
    var count : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textResult.text = "История изменений:"
        textResult.isEditable = false
        textResult.isSelectable = false
        textResult.isScrollEnabled = true
        // Do any additional setup after loading the view.
    }
    func convertDate() -> String {
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        let formattedDate = dateFormatter.string(from: Date())
        return formattedDate
    }
    @IBAction func pressPlus(_ sender: Any) {
        count += 1
        counterLabel.text = "Значение счётчика:\(count)"
        textResult.text = "\(convertDate()) : значение изменено на  +1"
    }
    @IBAction func pressMinus(_ sender: Any) {
        count -= 1
        if count < 0 {
            counterLabel.text = "Значение счётчика:\(count)"
            textResult.text = "\(convertDate()) : попытка уменьшить значение счётчика ниже 0"
        } else {
            counterLabel.text = "Значение счётчика:\(count)"
            textResult.text = "\(convertDate()) : значение изменено на  -1"
        }
    }
    @IBAction func pressClear(_ sender: Any) {
        count = 0
        counterLabel.text = "Значение счётчика:\(count)"
        textResult.text = "\(convertDate()) : значение сброшено"
    }
}

