//
//  TimeTablesData.swift
//  Navigation
//
//  Created by Vika on 04/11/2014.
//  Copyright (c) 2014 Vika. All rights reserved.
//

import Foundation
import UIKit

class TimeTablesData {
    
    let one = "1"
    let two = "2"
    let three = "3"
    let four = "4"
    let five = "5"
    let six = "6"
    let seven = "7"
    let eight = "8"
    let nine = "9"
    let ten = "10"
    let eleven="11"
    let twelve="12"
    
    var knownTimeTables = [String]()
    var allTimeTables = [String]()
    var numberButtons = [String:UIButton]()
    var calculationType:CalculationTypesEnum!
    var choosenTimesTable:String?
    var studyType:StudyTypeEnum!
    
    init()
    {
        initTimeTables()
    }
    
    func cleanNumberButtons()
    {
        numberButtons = [String:UIButton]()
    }
    
    func initTimeTables()
    {
        allTimeTables.append(one)
        allTimeTables.append(two)
        allTimeTables.append(three)
        allTimeTables.append(four)
        allTimeTables.append(five)
        allTimeTables.append(six)
        allTimeTables.append(seven)
        allTimeTables.append(eight)
        allTimeTables.append(nine)
        allTimeTables.append(ten)
        allTimeTables.append(eleven)
        allTimeTables.append(twelve)
    }
    
    func getUnknownTimeTables() -> Array<String>
    {
        var unknownTimeTables = [String]()
        for index_all in allTimeTables
        {
            var hasIndex = false
            for index in knownTimeTables
            {
                if(index == index_all)
                {
                    hasIndex = true
                    break
                }
            }
            if(!hasIndex)
            {
                unknownTimeTables.append(index_all)
                println(index_all)
            }
        }
        return unknownTimeTables
    }
    
    func fillTimeTablesArray()
    {
        for (buttonName, button) in numberButtons
        {
            if(button.selected)
            {
                knownTimeTables.append(buttonName)
            }
        }
    }
    
    func changeColorForButtonHelper(sender:UIButton)
    {
        println((sender.titleLabel?.text)!)
        var dictinaryKey = (sender.titleLabel?.text)!
        var button = numberButtons[dictinaryKey]
        var selected = button?.selected
        println("before selected")
        println(button?.selected)
        button?.selected = !selected!
        println(numberButtons[dictinaryKey]?.selected)
        
    }

    
}
