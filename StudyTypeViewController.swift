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

    override func viewDidLoad() {
        super.viewDidLoad()
        println(dataClass.choosenTimesTable)
        // Do any additional setup after loading the view.
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
        }
        practiceViewController.dataClass=dataClass
    }

}
