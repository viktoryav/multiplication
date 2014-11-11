//
//  StudyTypeEnum.swift
//  Multiplication
//
//  Created by Vika on 11/11/2014.
//  Copyright (c) 2014 Vika. All rights reserved.
//

import Foundation
enum StudyTypeEnum
{
    case RECAP
    case LEARN_NEW
    case PRACTICE_ALL
    
    static func getEnumByName(buttonName:String) -> StudyTypeEnum
    {
        switch buttonName
        {
            case "Recap":return StudyTypeEnum.RECAP
            case "Learn New":return StudyTypeEnum.LEARN_NEW
            default:return StudyTypeEnum.PRACTICE_ALL
        }
    }
}