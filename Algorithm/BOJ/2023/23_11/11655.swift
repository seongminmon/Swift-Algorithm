//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 11/27/23.
//
// 11655 : ROT13
// https://www.acmicpc.net/problem/11655

import Foundation

var str = readLine()!.map { String($0) }

let AValue = UnicodeScalar("A").value
let aValue = UnicodeScalar("a").value
for i in 0..<str.count {
    var value = UnicodeScalar(str[i])!.value
    
    if AValue <= value && value < AValue + 26 {
        value += 13
        if value >= AValue + 26 {
            value -= 26
        }
    } else if aValue <= value && value < aValue + 26 {
        value += 13
        if value >= aValue + 26 {
            value -= 26
        }
    }
    
    str[i] = String(UnicodeScalar(value)!)
}

print(str.joined())
