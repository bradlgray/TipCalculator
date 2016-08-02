//
//  ViewController.swift
//  TipCalculator
//
//  Created by Brad Gray on 7/29/16.
//  Copyright © 2016 Brad Gray. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    
    var calcData = CalcStorage(tipTotal: 0, tipPercentage: 0)
    
    @IBOutlet weak var enterTipAmount: UITextField!
    @IBOutlet weak var tipPercentage: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var tipNumber: UILabel!
    @IBOutlet weak var tipTotal: UILabel!

    @IBOutlet weak var splitBetweenHowManyPeople: UILabel!
    @IBOutlet weak var splitBetweenPeopleSlider: UISlider!
    @IBOutlet weak var splitBetweenPeopleTotal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        
    }
    override func viewWillAppear(_ animated: Bool) {
        enterTipAmount.delegate = self
        enterAmount()
        splitBetweenPeople()

    }

        func enterAmount() {
            
            calcData.tipTotal = ((enterTipAmount.text)! as NSString).doubleValue
            calcData.tipPercentage = Double(tipSlider.value)

            calcData.calculateTip()
            
            
            tipNumber.text = "\(calcData.tipAmount)"
            
            updateUI()
    }
    func updateUI() {
        tipNumber.text = String(format: "$%0.2f", calcData.tipAmount)
        tipTotal.text = String(format: "$%0.2f", calcData.totalAmount)
    }
    
    func splitBetweenPeople() {
        calcData.splitBetweenNumber = Double(splitBetweenPeopleSlider.value)
        splitBetweenHowManyPeople.text = "\(Int(calcData.splitBetweenNumber))"
        print(splitBetweenHowManyPeople.text)
        
        calcData.calculateAmountSplit()
        
        splitBetweenPeopleTotal.text = String(format: "$%0.2f", calcData.splitBetweenTotal)
       
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    @IBAction func AmountChanged(_ sender: AnyObject) {
        enterAmount()
       splitBetweenPeople()
       
    }
    @IBAction func TipSliderAction(_ sender: AnyObject) {
        tipPercentage.text = "\(Int(tipSlider.value * 100)) %"
        enterAmount()
        splitBetweenPeople()
       
    }
    
    @IBAction func SplitBetweenPeopleAction(_ sender: AnyObject) {
         splitBetweenPeople()
        enterAmount()
    }
}

