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
    
    var tests:[Int]!
    var currentTest:Int!
    var currentAnswer:Int!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println(dataClass.studyType)
        //var timer = NSTimer.scheduledTimerWithTimeInterval(10, target: self, selector: Selector("finish"), userInfo: nil, repeats: true)
        tests = dataClass.getPracticeTestsAsInt()
        var label = getNextTest()
        labelTest.text=label
        resultLabel.text=""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func finish()
    {
        println("Timer has finished")
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
                var label = getNextTest()
                //sleep(2)
                labelTest.text=label
                labelAnswer.text=""
            }
            else
            {
                resultLabel.text = "Try again!"
                labelAnswer.text=""
            }
            
        }
        else
        {
            resultLabel.text = ""
        }
        
    }
    
    func getNextTest() -> String
    {
        var randomNumber : Int = Int(rand()) % (tests.count - 1)
        currentTest = tests[randomNumber]
        var testStr = dataClass.choosenTimesTable! + " " + CalculationTypesEnum.getStringByEnum(dataClass.calculationType) + " " + currentTest.description + " = "
        if(dataClass.calculationType == CalculationTypesEnum.MULTIPLICATION)
        {
            currentAnswer = currentTest*dataClass.choosenTimesTable!.toInt()!
        }
        return testStr
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
