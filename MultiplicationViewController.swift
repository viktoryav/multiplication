//
//  MultiplicationViewController.swift
//  Multiplication
//
//  Created by Vika on 10/11/2014.
//  Copyright (c) 2014 Vika. All rights reserved.
//

import UIKit

class MultiplicationViewController: UIViewController {

    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var buttonFour: UIButton!
    @IBOutlet weak var buttonFive: UIButton!
    @IBOutlet weak var buttonSix: UIButton!
    @IBOutlet weak var buttonSeven: UIButton!
    @IBOutlet weak var buttonEight: UIButton!
    @IBOutlet weak var buttonNine: UIButton!
    @IBOutlet weak var buttonTen: UIButton!
    @IBOutlet weak var buttonEleven: UIButton!
    @IBOutlet weak var buttonTwelve: UIButton!
    
    var dataClass = TimeTablesData()
    
    var numberButtons = [String:UIButton]()

    
    override func viewDidLoad() {
        numberButtons[dataClass.one] = buttonOne
        numberButtons[dataClass.two] = buttonTwo
        numberButtons[dataClass.three] = buttonThree
        numberButtons[dataClass.four] = buttonFour
        numberButtons[dataClass.five] = buttonFive
        numberButtons[dataClass.six] = buttonSix
        numberButtons[dataClass.seven] = buttonSeven
        numberButtons[dataClass.eight] = buttonEight
        numberButtons[dataClass.nine] = buttonNine
        numberButtons[dataClass.ten] = buttonTen
        numberButtons[dataClass.eleven] = buttonEleven
        numberButtons[dataClass.twelve] = buttonTwelve
        super.viewDidLoad()
    }

    @IBAction func changeColorForButton(sender: UIButton) {
        changeColorForButtonHelper(sender)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "goMultiplicationChoose" {
            fillTimeTablesArray()
            var selectStudyViewController: MultiplicationChooseViewController = segue.destinationViewController as MultiplicationChooseViewController
            selectStudyViewController.dataClass=dataClass

        }
        
    }
    
    func fillTimeTablesArray()
    {
        for (buttonName, button) in numberButtons
        {
            if(button.selected)
            {
                dataClass.knownTimeTables.append(buttonName)
            }
        }
    }
    
    func changeColorForButtonHelper(sender:UIButton)
    {
        println((sender.titleLabel?.text)!)
        var dictinaryKey = (sender.titleLabel?.text)!
        var button = numberButtons[dictinaryKey]
        var selected = button?.selected
        button?.selected = !selected!
        if(selected!)
        {
            println("not selected")
        }
        else
        {
            
                sender.layer.borderColor = UIColor.whiteColor().CGColor
                sender.layer.borderWidth = 3
                sender.layer.cornerRadius = sender.frame.size.width / 2
        }
        
    }

}
