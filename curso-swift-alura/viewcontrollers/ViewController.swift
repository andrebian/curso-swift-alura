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
    var delegate: MealsTableViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let saveButton = UIBarButtonItem(title: NSLocalizedString("Confirm", comment: ""), style: .Plain, target: self, action: Selector("add"))
        
        self.navigationItem.rightBarButtonItem = saveButton
    }
    
    func add() {
        
        if nameField.text == nil || happinessField.text == nil {
            return
        }
        
        let name = nameField.text!
        let happiness = Int(happinessField.text!)
        
        if happiness == nil {
            return
        }
        
        let meal: Meal = Meal(name: name, happiness: happiness!)
        
        print("eaten: name \(meal.name) happiness \(meal.happiness)")
        
        if delegate == nil {
            return
        }
        delegate!.add(meal)
        
        if let navigation = self.navigationController {
            navigation.popViewControllerAnimated(true)
        }
    }


}

