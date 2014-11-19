//
//  MultiplicationChooseViewController.swift
//  Multiplication
//
//  Created by Vika on 10/11/2014.
//  Copyright (c) 2014 Vika. All rights reserved.
//

import UIKit

class MultiplicationChooseViewController: UIViewController {
    
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
    @IBOutlet weak var recapLabel: UIButton!
    
    
    var dataClass:TimeTablesData!

    override func viewDidLoad() {
        super.viewDidLoad()
        initNumberButtons()
        initButtons()
    }
    
    
    func initButtons()
    {
        for choosenButtonName in dataClass.knownTimeTables
        {
            for (buttonName, button) in dataClass.numberButtons
            {
                if(choosenButtonName.description == buttonName)
                {
                    button.setTitleColor(UIColor.greenColor(), forState: UIControlState.Normal)
                    break;
                }
            }
            
        }
    }
    
    @IBAction func readButtonAndNavigate(sender: UIButton) {
        dataClass.choosenTimesTable=sender.titleLabel?.text
        if(dataClass.knownTimeTables.count==0 || dataClass.isInKnownTables())
        {
            performSegueWithIdentifier("navigateToP", sender: sender)
        }
        else
        {
            performSegueWithIdentifier("navigateToST", sender: sender)

        }
        
    }
    
    func initNumberButtons()
    {
        dataClass.cleanNumberButtons()
        dataClass.numberButtons[dataClass.one.description] = buttonOne
        dataClass.numberButtons[dataClass.two.description] = buttonTwo
        dataClass.numberButtons[dataClass.three.description] = buttonThree
        dataClass.numberButtons[dataClass.four.description] = buttonFour
        dataClass.numberButtons[dataClass.five.description] = buttonFive
        dataClass.numberButtons[dataClass.six.description] = buttonSix
        dataClass.numberButtons[dataClass.seven.description] = buttonSeven
        dataClass.numberButtons[dataClass.eight.description] = buttonEight
        dataClass.numberButtons[dataClass.nine.description] = buttonNine
        dataClass.numberButtons[dataClass.ten.description] = buttonTen
        dataClass.numberButtons[dataClass.eleven.description] = buttonEleven
        dataClass.numberButtons[dataClass.twelve.description] = buttonTwelve
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier=="navigateToST")
        {
            var studyTypeViewController: StudyTypeViewController = segue.destinationViewController as StudyTypeViewController
            studyTypeViewController.dataClass=dataClass
        }
        else if(segue.identifier=="navigateToP")
        {
            dataClass.studyType = StudyTypeEnum.PRACTICE_ALL
            var practiceViewController: PracticeViewController = segue.destinationViewController as PracticeViewController
            practiceViewController.dataClass=dataClass
        }
        else if(segue.identifier == "backToTimeTables")
        {
            var multiplicationViewController: MultiplicationViewController = segue.destinationViewController as MultiplicationViewController
            dataClass.cleanKnownTimeTables()
            multiplicationViewController.dataClass=dataClass
        }
    }

    

}
