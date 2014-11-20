//
//  ViewController.swift
//  Multiplication
//
//  Created by Vika on 08/11/2014.
//  Copyright (c) 2014 Vika. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var multiplicationButton: UIButton!
    
    @IBOutlet weak var divisionButton: UIButton!

    var dataClass = TimeTablesData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func openPrivacyPolicy(sender: UIButton) {
        let url = "https://www.iubenda.com/privacy-policy/752356"
        
        let targetURL=NSURL.URLWithString(url)
        
        let application=UIApplication.sharedApplication()
        
        application.openURL(targetURL);
        
    }
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        var multiplicationViewController: MultiplicationViewController = segue.destinationViewController as MultiplicationViewController
        if let button = sender as? UIButton {
            var calculationType = CalculationTypesEnum.getEnumByName(button.titleLabel!.text!)
            dataClass.calculationType = calculationType
        }
        multiplicationViewController.dataClass=dataClass
    }

}

