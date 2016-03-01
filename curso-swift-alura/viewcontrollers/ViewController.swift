//
//  ViewController.swift
//  curso-swift-alura
//
//  Created by Andre Cardoso on 10/15/15.
//  Copyright © 2015 FourItil Tecnologia. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var nameField: UITextField!
    @IBOutlet var happinessField: UITextField!
    var delegate: AddMealDelegate?
    var items = [
        Item(name: "Eggplant brownie", calories: 10.0),
        Item(name: "teste 1", calories: 10.0),
        Item(name: "Teste 2", calories: 10.0),
        Item(name: "Teste 3", calories: 10.0),
        Item(name: "Teste 4", calories: 10.0),
    ]
    var selected: [Item] = Array<Item>()
    
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

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        
        let row = indexPath.row
        let item = items[row]
        
        cell.textLabel?.text = item.name
        
        return cell
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        if cell == nil {
            return
        }
        if cell?.accessoryType == UITableViewCellAccessoryType.None {
            cell?.accessoryType = UITableViewCellAccessoryType.Checkmark
            selected.append(items[indexPath.row])
        } else {
            cell?.accessoryType = UITableViewCellAccessoryType.None
        }
    }

}

