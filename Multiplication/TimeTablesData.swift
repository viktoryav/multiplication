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
    
    let one = 1
    let two = 2
    let three = 3
    let four = 4
    let five = 5
    let six = 6
    let seven = 7
    let eight = 8
    let nine = 9
    let ten = 10
    let eleven=11
    let twelve=12
    
    var knownTimeTables = [Int]()
    var allTimeTablesInt = [Int]()
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
    
    func cleanKnownTimeTables()
    {
        knownTimeTables = [Int]()
    }
    
    func cleanChoosenTimeTable()
    {
        choosenTimesTable = nil
    }
    
    func isInKnownTables() -> Bool
    {
        for index in knownTimeTables
        {
            if(choosenTimesTable == index.description)
            {
                return true
            }
        }
        return false
    }
    
    func initTimeTables()
    {
        allTimeTablesInt.append(one)
        allTimeTablesInt.append(two)
        allTimeTablesInt.append(three)
        allTimeTablesInt.append(four)
        allTimeTablesInt.append(five)
        allTimeTablesInt.append(six)
        allTimeTablesInt.append(seven)
        allTimeTablesInt.append(eight)
        allTimeTablesInt.append(nine)
        allTimeTablesInt.append(ten)
        allTimeTablesInt.append(eleven)
        allTimeTablesInt.append(twelve)
    }
    
    
    func getLearnNewTestsAsString() -> [String]
    {
        var practiceTests = [String]()
        for index_all in allTimeTablesInt
        {
            var hasIndex = false
            knownTimeTables.sort{$0 < $1}
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
                var test = createTest(index_all)
                practiceTests.append(test)
                println(index_all)
            }
        }
        return practiceTests
    }
    
    func createTest(index:Int) -> String
    {
        var test = ""
        if(calculationType == CalculationTypesEnum.DIVISION)
        {
            var divisionElement = (choosenTimesTable!.toInt())!*index
            test = divisionElement.description + " " + CalculationTypesEnum.getStringByEnum(calculationType) + " " + choosenTimesTable!
        }
        else
        {
            test = choosenTimesTable! + " " + CalculationTypesEnum.getStringByEnum(calculationType) + " " + index.description
        }
        
        return test
    }
    
    func getRecapTestsAsString()->[String]
    {
            var practiceTests = [String]()
            knownTimeTables.sort{$0 < $1}
            for index in knownTimeTables
            {
                var test = createTest(index)
                practiceTests.append(test)
            }
        return practiceTests
    }
    
    func getAllTestsAsString()->[String]
    {
        var practiceTests = [String]()
        for index in allTimeTablesInt
        {
            var test = createTest(index)
            practiceTests.append(test)
        }
        return practiceTests
    }
    
    func getTestsAsString(tests:[String])->String
    {
        var testsString=""
        var counter=1
        for test in tests
        {
            if(counter == tests.count)
            {
                testsString = testsString + test
            }
            else
            {
                testsString = testsString + test + ", "
            }
            
            counter++
            
        }
        return testsString
    }
    
    
    func getTestsForPracticeAsInt() -> [Int]
    {
        if(studyType == StudyTypeEnum.PRACTICE_ALL)
        {
            return allTimeTablesInt
        }
        else if(studyType == StudyTypeEnum.LEARN_NEW)
        {
            return getLearnNewTestsAsInt()
        }
        else
        {
            return knownTimeTables
        }
    }
    

    
    func getLearnNewTestsAsInt() -> [Int]
    {
        var practiceTests = [Int]()
        for index_all in allTimeTablesInt
        {
            var hasIndex = false
            knownTimeTables.sort{$0 < $1}
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
                practiceTests.append(index_all)
            }
        }

        return practiceTests
        
    }
    
    func fillTimeTablesArray()
    {
        for (buttonName, button) in numberButtons
        {
            if(button.selected)
            {
                let buttonInt:Int!=buttonName.toInt()
                knownTimeTables.append(buttonInt)
            }
        }
    }
    
    func changeColorForButtonHelper(sender:UIButton)
    {
        var dictinaryKey = (sender.titleLabel?.text)!
        var button = numberButtons[dictinaryKey]
        var selected = button?.selected
        button?.selected = !selected!        
    }

    
}
