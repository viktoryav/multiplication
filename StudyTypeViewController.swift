//
//  StudyTypeViewController.swift
//  Multiplication
//
//  Created by Vika on 10/11/2014.
//  Copyright (c) 2014 Vika. All rights reserved.
//

import UIKit

class StudyTypeViewController: UIViewController {
    var dataClass:TimeTablesData!

    @IBOutlet weak var recapLabel: UILabel!
    
    @IBOutlet weak var learnNewLabel: UILabel!
    
    @IBOutlet weak var practiceAllLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        var practiceTests = dataClass.getPracticeTestsAsString()
        for test in practiceTests
        {
            println(test)
        }
        println("recap tests")
        var recapTests = dataClass.getRecapTestsAsString()
        for test in recapTests
        {
            println(test)
        }
        recapLabel.text = dataClass.getTestsAsString(dataClass.getRecapTestsAsString())
        learnNewLabel.text = dataClass.getTestsAsString(dataClass.getPracticeTestsAsString())
        practiceAllLabel.text = dataClass.getTestsAsString(dataClass.getAllTestsAsString())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
<<<<<<< HEAD
        if(segue.identifier == "backToChoose")
        {
            var multiplicationChooseViewController: MultiplicationChooseViewController = segue.destinationViewController as MultiplicationChooseViewController
            multiplicationChooseViewController.dataClass=dataClass
=======
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        println("in prepareForSegue StudyTypeViewController")
        var practiceViewController: PracticeViewController = segue.destinationViewController as PracticeViewController
        println("in prepareForSegue StudyTypeViewController2")
        if let button = sender as? UIButton {
            println("in prepareForSegue StudyTypeViewController3")
            println(button.titleLabel?.text)
            var studyType = StudyTypeEnum.getEnumByName(button.titleLabel!.text!)
            dataClass.studyType = studyType
>>>>>>> parent of 3f9ca69... finish navigation
        }
        else
        {
            var practiceViewController: PracticeViewController = segue.destinationViewController as PracticeViewController
            if let button = sender as? UIButton {
                var studyType = StudyTypeEnum.getEnumByName(button.titleLabel!.text!)
                dataClass.studyType = studyType
            }
            practiceViewController.dataClass=dataClass
        }
        
    }

}
