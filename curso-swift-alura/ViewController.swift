//
//  ViewController.swift
//  curso-swift-alura
//
//  Created by Andre Cardoso on 10/15/15.
//  Copyright © 2015 FourItil Tecnologia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var nameField: UITextField!
    @IBOutlet var happinessField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func add() {
        
        let name = nameField.text
        let happiness = happinessField.text
        
        print("eaten: name \(name) happiness \(happiness)")
    }


}

