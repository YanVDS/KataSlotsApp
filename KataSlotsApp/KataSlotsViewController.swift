//
//  ViewController.swift
//  KataSlotsApp
//
//  Created by Yannick Vanderstraeten on 22/03/2019.
//  Copyright © 2019 TeleSoftas. All rights reserved.
//

import UIKit

class KataSlotsViewController: UIViewController {

    // MARK: - Declarations

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        startSlots()
    }

    func startSlots() {
        let result = numberOfSlots()

        print("\(result)")
    }

    func numberOfSlots() -> Int {
        return 3
    }

}

