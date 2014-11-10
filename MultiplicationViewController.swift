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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initNumberButtons()
    }
    
    func initNumberButtons()
    {
        dataClass.cleanNumberButtons()
        dataClass.numberButtons[dataClass.one] = buttonOne
        dataClass.numberButtons[dataClass.two] = buttonTwo
        dataClass.numberButtons[dataClass.three] = buttonThree
        dataClass.numberButtons[dataClass.four] = buttonFour
        dataClass.numberButtons[dataClass.five] = buttonFive
        dataClass.numberButtons[dataClass.six] = buttonSix
        dataClass.numberButtons[dataClass.seven] = buttonSeven
        dataClass.numberButtons[dataClass.eight] = buttonEight
        dataClass.numberButtons[dataClass.nine] = buttonNine
        dataClass.numberButtons[dataClass.ten] = buttonTen
        dataClass.numberButtons[dataClass.eleven] = buttonEleven
        dataClass.numberButtons[dataClass.twelve] = buttonTwelve
    }

    @IBAction func changeColorForButton(sender: UIButton) {
        dataClass.changeColorForButtonHelper(sender)
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
            dataClass.fillTimeTablesArray()
            var selectStudyViewController: MultiplicationChooseViewController = segue.destinationViewController as MultiplicationChooseViewController
            selectStudyViewController.dataClass=dataClass
        }
        
    }
    
    
}
