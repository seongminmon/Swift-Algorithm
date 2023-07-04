//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/03.
//
// 1406 : 에디터
// https://www.acmicpc.net/problem/1406

import Foundation

// 입력
var leftStr = readLine()!
var rightStr = ""
let m = Int(readLine()!)!

// 출력
for _ in 0 ..< m {
    let order = readLine()!
    
    switch order {
    case "L":
        if !leftStr.isEmpty {
            rightStr.append(leftStr.removeLast())
        }
    case "D":
        if !rightStr.isEmpty {
            leftStr.append(rightStr.removeLast())
        }
    case "B":
        if !leftStr.isEmpty {
            leftStr.removeLast()
        }
    default:
        leftStr.append(order.last!)
    }
}

// 출력
print(leftStr + rightStr.reversed())
