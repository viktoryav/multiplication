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
        if(dataClass.firstLevelStudyType == StudyTypeEnum.LEARN_NEW)
        {
            initLearnNewButtons()
        }
        else
        {
            initRecapButtons()
        }
        
    }
    
    func initRecapButtons()
    {
        for (buttonName, button) in dataClass.numberButtons
        {
            button.hidden=true
        }
        for choosenButtonName in dataClass.knownTimeTables
        {
            for (buttonName, button) in dataClass.numberButtons
            {
                if(choosenButtonName.description == buttonName)
                {
                    button.hidden=false
                    break;
                }
            }
            
        }
    }
    
    func initLearnNewButtons()
    {
        for choosenButtonName in dataClass.knownTimeTables
        {
            for (buttonName, button) in dataClass.numberButtons
            {
                if(choosenButtonName.description == buttonName)
                {
                    println("in selected")
                    button.hidden=true
                    break;
                }
            }
            
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
    
    
    @IBAction func navigate(sender: UIButton) {
        println("in navigate")
        dataClass.choosenTimesTable=sender.titleLabel?.text
        println(sender.titleLabel?.text)
        if(dataClass.firstLevelStudyType == StudyTypeEnum.LEARN_NEW)
        {
            println("in learn new")
            let viewController:AnyObject? = self.storyboard?.instantiateViewControllerWithIdentifier("studyType")
            //let viewController:AnyObject? = self.storyboard?.instantiateViewControllerWithIdentifier("studyType")
            println("in learn new 1")
            (viewController as StudyTypeViewController).dataClass = dataClass
            println("in learn new 2")
            //self.showViewController(viewController as UIViewController, sender: viewController)
            //let t: BooleanLiteralConvertible = true;
            //self.presentViewController(viewController, animated: true, completion: nil)
            //self.presentViewController(viewController, animated: true, completion: nil)
            //if (self.respondsToSelector:Selector("showViewController"))
            //{
                self.showViewController(viewController as UIViewController, sender: viewController)
            //}
            println("in learn new 3")
        }
        else
        {
            println("in else")
            let viewController:AnyObject? = self.storyboard?.instantiateViewControllerWithIdentifier("practice")
            println("in else 1")
            dataClass.studyType = StudyTypeEnum.PRACTICE_ALL
            println("in else 2")
            (viewController as PracticeViewController).dataClass = dataClass
            println("in else 3")
            self.showViewController(viewController as UIViewController, sender: viewController)
            println("in else 4")
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "backToTimeTables")
        {
            var multiplicationViewController: MultiplicationViewController = segue.destinationViewController as MultiplicationViewController
            multiplicationViewController.dataClass=dataClass
        }
        
    }

    

}
