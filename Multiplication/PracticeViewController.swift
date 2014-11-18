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
    var timer:NSTimer?
    
    
    override func viewDidLoad() {
        println("in PracticeViewController")
        super.viewDidLoad()
        println(dataClass.studyType)
        timer = NSTimer.scheduledTimerWithTimeInterval(60, target: self, selector: Selector("finish"), userInfo: nil, repeats: false)
        
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
        performSegueWithIdentifier("navigateToResults", sender: self)
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
                amimateAnswerLabel(label!)
                correctAnswers++
                correctLabel.text = correctAnswers.description
            }
            else
            {
                amimateWrongAnswerLabel(label!)
                incorrectAnswers++
                incorrectLabel.text = incorrectAnswers.description
            }
            var nextTest = getNextTest()
            labelTest.text=nextTest
            
        }
        else
        {
            resultLabel.text = ""
            incorrectResultLabel.hidden=true
        }
        
    }
    
    func amimateWrongAnswerLabel(label:String)
    {
        UIView.animateWithDuration(1.0,
            delay: 0.0,
            options: .CurveEaseInOut | .AllowUserInteraction,
            animations: {
                self.incorrectResultLabel.hidden=false
                self.incorrectResultLabel.alpha = 0.0
                self.resultLabel.text=self.currentAnswer.description
                self.resultLabel.alpha = 0.0
                self.labelAnswer.text=label
                self.labelAnswer.alpha = 0.0
            }, completion: { finished in
                self.incorrectResultLabel.hidden=true
                self.incorrectResultLabel.alpha = 1.0
                self.resultLabel.text=""
                self.resultLabel.alpha = 1.0
                self.labelAnswer.text=""
                self.labelAnswer.alpha = 1.0
        })
    }
    
    func amimateAnswerLabel(label:String)
    {
        UIView.animateWithDuration(1.0,
            delay: 0.0,
            options: .CurveEaseInOut | .AllowUserInteraction,
            animations: {
                self.labelAnswer.text=label
                self.labelAnswer.alpha = 0.0
                self.resultLabel.text = "Well done!"
                self.resultLabel.alpha = 0.0
            }, completion: { finished in
                self.labelAnswer.text=""
                self.labelAnswer.alpha = 1.0
                self.resultLabel.alpha = 1.0
                self.resultLabel.text = ""
        })
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier=="navigateToResults")
        {
            var resultsViewController: ResultsViewController = segue.destinationViewController as ResultsViewController
            resultsViewController.dataClass=dataClass
            resultsViewController.correctAnswers = correctAnswers
            resultsViewController.allAnswers = correctAnswers + incorrectAnswers
        } else if (segue.identifier=="backToST")
        {
            timer?.invalidate()
            var studyTypeViewController: StudyTypeViewController = segue.destinationViewController as StudyTypeViewController
            studyTypeViewController.dataClass=dataClass
        }
    }

}
