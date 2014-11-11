//
//  CalculationTypesEnum.swift
//  Multiplication
//
//  Created by Vika on 10/11/2014.
//  Copyright (c) 2014 Vika. All rights reserved.
//

import Foundation
enum CalculationTypesEnum
{
    case MULTIPLICATION
    case DIVISION
    
    static func getEnumByName(buttonName:String) -> CalculationTypesEnum
    {
        switch buttonName
        {
            case "Division":return CalculationTypesEnum.DIVISION
            default:return CalculationTypesEnum.MULTIPLICATION
        }
    }
}
