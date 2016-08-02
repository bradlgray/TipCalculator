//
//  CalcStorage.swift
//  TipCalculator
//
//  Created by Brad Gray on 7/31/16.
//  Copyright © 2016 Brad Gray. All rights reserved.
//

import UIKit


class CalcStorage {
    private var _tipPercentage = 0.0
    private var _tipAmount = 0.0
    private var _tipTotal = 0.0
    private var _totalAmount = 0.0
    private var _splitBetweenNumber = 0.0
    private var _splitBetweenTotal = 0.0
    
    
    var tipPercentage: Double {
        get {
            return _tipPercentage
        } set {  _tipPercentage = newValue
      
        }
    }
    
    var tipTotal: Double {
        get {
          return _tipTotal
       
        } set {
            _tipTotal = newValue
        }
    }
    
    var tipAmount: Double {
        get {
            return _tipAmount

        }
    }

    var totalAmount: Double {
        get {
              return _totalAmount
        } set {
            _totalAmount = newValue
        }
       
       
    }
    
    var splitBetweenNumber: Double {
        get {
            return _splitBetweenNumber
        } set {
            _splitBetweenNumber = newValue
        }
    }
    var splitBetweenTotal: Double {
        return _splitBetweenTotal
    }
    
     init(tipTotal: Double, tipPercentage: Double) {
        self._tipAmount = tipTotal
        self._tipAmount = tipPercentage
        
    }
    
    func calculateTip()  {
        _tipAmount = tipPercentage * tipTotal
        _totalAmount = tipTotal + tipAmount
    }
    func calculateAmountSplit() {
        _splitBetweenTotal = totalAmount / splitBetweenNumber
    }
}
