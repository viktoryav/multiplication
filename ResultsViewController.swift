//
//  ResultsViewController.swift
//  Multiplication
//
//  Created by Vika on 13/11/2014.
//  Copyright (c) 2014 Vika. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    var dataClass:TimeTablesData!
    var correctAnswers:Int?
    var allAnswers:Int?
    @IBOutlet weak var changeCalculationTypeButton: UIButton!
    
    @IBOutlet weak var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        println(changeCalculationTypeButton.titleLabel?.text)
        if(dataClass.calculationType == CalculationTypesEnum.DIVISION)
        {
            println("in if")
            changeCalculationTypeButton.setTitle("Multiply Now!", forState: UIControlState.Normal)
        }
        else
        {
            println("in else")
            changeCalculationTypeButton.setTitle("Divide Now!", forState: UIControlState.Normal)
        }
        resultLabel.text = correctAnswers!.description + " out of " + allAnswers!.description + "!!!"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        println("in ResultsViewController prepareForSegue")
        println(segue.identifier)

        
        if(segue.identifier=="toDivideNow")
        {
            if(dataClass.calculationType == CalculationTypesEnum.MULTIPLICATION)
            {
                dataClass.calculationType = CalculationTypesEnum.DIVISION
            }
            else
            {
                dataClass.calculationType = CalculationTypesEnum.MULTIPLICATION
            }
            var studyTypeViewController: StudyTypeViewController = segue.destinationViewController as StudyTypeViewController
            studyTypeViewController.dataClass=dataClass

        }
        else if(segue.identifier=="toPlayAgain")
        {
            var studyTypeViewController: StudyTypeViewController = segue.destinationViewController as StudyTypeViewController
            studyTypeViewController.dataClass=dataClass

        }
        else if(segue.identifier=="toChangeTimeTable")
        {
            var multiplicationChooseViewController: MultiplicationChooseViewController = segue.destinationViewController as MultiplicationChooseViewController
            multiplicationChooseViewController.dataClass=dataClass
        }
    }

}
