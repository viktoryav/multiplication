//
//  PracticeViewController.swift
//  Multiplication
//
//  Created by Vika on 10/11/2014.
//  Copyright (c) 2014 Vika. All rights reserved.
//

import UIKit

class PracticeViewController: UIViewController {
    var dataClass:TimeTablesData!

    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var seven: UIButton!
    @IBOutlet weak var eight: UIButton!
    @IBOutlet weak var nine: UIButton!
    @IBOutlet weak var zero: UIButton!
    
    @IBOutlet weak var labelTest: UILabel!
    @IBOutlet weak var labelAnswer: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var correctLabel: UILabel!
    @IBOutlet weak var incorrectLabel: UILabel!
    @IBOutlet weak var incorrectResultLabel: UILabel!
    
    var tests:[Int]!
    var currentTest:Int!
    var currentAnswer:Int!
    var correctAnswers = 0
    var incorrectAnswers = 0
    
    
    override func viewDidLoad() {
        println("in PracticeViewController")
        super.viewDidLoad()
        println(dataClass.studyType)
        var timer = NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: Selector("finish"), userInfo: nil, repeats: false)
        tests = dataClass.getTestsForPracticeAsInt()
        var label = getNextTest()
        labelTest.text=label
        resultLabel.text=""
        correctLabel.text = "0"
        incorrectLabel.text = "0"
        incorrectResultLabel.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func finish()
    {
        println("Timer has finished")
        let viewController:AnyObject? = self.storyboard?.instantiateViewControllerWithIdentifier("resultsView")
        (viewController as ResultsViewController).dataClass = dataClass
        (viewController as ResultsViewController).correctAnswers = correctAnswers
        (viewController as ResultsViewController).allAnswers=correctAnswers + incorrectAnswers
        self.showViewController(viewController as UIViewController, sender: viewController)
    }
    

    @IBAction func readNumber(sender: UIButton) {
        var dictinaryKey = (sender.titleLabel?.text)!
        var label = labelAnswer.text
        var answerLength = countElements(currentAnswer.description)
        label=label!+dictinaryKey
        var labelLength = countElements(label!)
        println(label)
        labelAnswer.text=label
        
        if(labelLength==answerLength)
        {
            if(currentAnswer == label?.toInt())
            {
                resultLabel.text = "Well done!"
                correctAnswers++
                correctLabel.text = correctAnswers.description
            }
            else
            {
                incorrectResultLabel.hidden=false
                resultLabel.text = currentAnswer.description
                labelAnswer.text=""
                incorrectAnswers++
                incorrectLabel.text = incorrectAnswers.description
            }
            var label = getNextTest()
            //sleep(2)
            labelTest.text=label
            labelAnswer.text=""
        }
        else
        {
            resultLabel.text = ""
            incorrectResultLabel.hidden=true
        }
        
    }
    
    func getNextTest() -> String
    {
        var randomNumber : Int = Int(rand()) % (tests.count)
        currentTest = tests[randomNumber]
        var testStr = dataClass.createTest(currentTest) + " = "
        if(dataClass.calculationType == CalculationTypesEnum.MULTIPLICATION)
        {
            currentAnswer = currentTest*dataClass.choosenTimesTable!.toInt()!
        }
        else
        {
            currentAnswer = currentTest
        }
        return testStr
    }

}
