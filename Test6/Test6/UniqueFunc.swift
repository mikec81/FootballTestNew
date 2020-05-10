//
//  UniqueFunc.swift
//  Test6
//
//  Created by mikecurtis on 04/08/2019.
//  Copyright © 2019 mikecurtis. All rights reserved.
//

import SwiftUI
import Combine



func UniArray(InputArray: [String]) -> [String]
  {
    var unique: [String] = []
    
    for stringcheck in InputArray {
        var stringisNew = true
        
        for otherString in unique{
            if stringcheck == otherString {
                stringisNew = false
                break
            }
        }
        
        if stringisNew {
            unique.append(stringcheck)
        }
        
            }
return unique
    
}
        
        

