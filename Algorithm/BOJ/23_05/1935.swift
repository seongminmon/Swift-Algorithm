//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/05/29.
//
// 1935 : 후위 표기식2
// https://www.acmicpc.net/problem/1935

import Foundation

let n = Int(readLine()!)!
var arr = Array(readLine()!)
var dict = [Character: Double]()
for i in 0..<n {
    let num = Double(readLine()!)!
    dict[Character(UnicodeScalar(65 + i)!)] = num
}

var stack = [Double]()
for i in 0..<arr.count {
    if arr[i].isLetter {
        let num = dict[arr[i]]!
        stack.append(num)
    } else {
        let num2 = stack.removeLast()
        let num1 = stack.removeLast()
        switch arr[i] {
        case "+":
            stack.append(num1 + num2)
        case "-":
            stack.append(num1 - num2)
        case "*":
            stack.append(num1 * num2)
        default:
            stack.append(num1 / num2)
        }
    }
}
print(String(format: "%.2f", stack.last!))
