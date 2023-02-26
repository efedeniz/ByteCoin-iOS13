//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
   
    

    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var curreyPicker: UIPickerView!
    
    public var coinManager : CoinManager?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        coinManager = CoinManager()
        coinManager?.delegate = self
        curreyPicker.dataSource = self
        curreyPicker.delegate = self
    }

    
   
}

