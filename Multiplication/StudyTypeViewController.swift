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
    @IBOutlet weak var recapButton: UIButton!
    
    @IBOutlet weak var practiceAllButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(dataClass.knownTimeTables.count==0 || dataClass.isInKnownTables())
        {
            recapLabel.hidden = true
            practiceAllLabel.hidden = true
            practiceAllButton.hidden = true
            recapButton.hidden = true
        }
        else
        {
            recapLabel.text = dataClass.getTestsAsString(dataClass.getRecapTestsAsString())
            practiceAllLabel.text = dataClass.getTestsAsString(dataClass.getAllTestsAsString())
        }
        learnNewLabel.text = dataClass.getTestsAsString(dataClass.getLearnNewTestsAsString())
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "backToChoose")
        {
            var multiplicationChooseViewController: MultiplicationChooseViewController = segue.destinationViewController as MultiplicationChooseViewController
            dataClass.cleanChoosenTimeTable()
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
