//
//  Fibonachi.swift
//  FibBigIntTest
//
//  Created by Алексей Малашенков on 04.03.17.
//  Copyright © 2017 Алексей Малашенков. All rights reserved.
//

import Foundation
import BigInt

class Fibonachi {
    
   class func calcFibonachi(n: Int) -> [String] {
        var a: BigUInt = 1
        var b: BigUInt = 1
    
        var massFib:[String] = []
        massFib.append("Fib 1: " + String(a))
        for i in 2...n {
            let temp = a
            a = b
            b = temp + b
            massFib.append("Fib " + String(i) + ": " + String(a))
        }
        return massFib
    }
}

