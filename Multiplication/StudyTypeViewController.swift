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
       
        recapLabel.text = dataClass.getTestsAsString(dataClass.getRecapTestsAsString())
        learnNewLabel.text = dataClass.getTestsAsString(dataClass.getPracticeTestsAsString())
        practiceAllLabel.text = dataClass.getTestsAsString(dataClass.getAllTestsAsString())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "backToChoose")
        {
            var multiplicationChooseViewController: MultiplicationChooseViewController = segue.destinationViewController as MultiplicationChooseViewController
            multiplicationChooseViewController.dataClass=dataClass
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
