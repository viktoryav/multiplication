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
        // Do any additional setup after loading the view.
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
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        println("in prepareForSegue !backMCtoHome")
        if segue.identifier != "backMCtoHome" {
            println("in prepareForSegue !backMCtoHome2")
            var studyTypeViewController: StudyTypeViewController = segue.destinationViewController as StudyTypeViewController
            if let button = sender as? UIButton {
                println(button.titleLabel?.text)
                dataClass.choosenTimesTable=button.titleLabel?.text
            }
            studyTypeViewController.dataClass=dataClass
        }
        
    }
<<<<<<< HEAD
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "backToTimeTables")
        {
            var multiplicationViewController: MultiplicationViewController = segue.destinationViewController as MultiplicationViewController
            multiplicationViewController.dataClass=dataClass
        }
        
    }

    
=======

>>>>>>> parent of 3f9ca69... finish navigation

}
