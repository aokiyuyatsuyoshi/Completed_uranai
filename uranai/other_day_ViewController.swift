//
//  other_day_ViewController.swift
//  uranai
//
//  Created by Yuya Aoki on 2020/03/25.
//  Copyright © 2020 Yuya Aoki. All rights reserved.
//

import UIKit

class other_day_ViewController: UIViewController{
 
    
    @IBOutlet weak var otherdaylabal: UIDatePicker!
    
   
    @IBAction func do_it(_ sender: Any) {
            self.performSegue(withIdentifier: "other_resultsegue", sender: nil)
                   print("ffaa")
    }
    var datePicker: UIDatePicker = UIDatePicker()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
 }
   


