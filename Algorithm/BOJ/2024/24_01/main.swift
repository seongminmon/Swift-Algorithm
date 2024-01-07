//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 1/7/24.
//
// 15926 : 현욱은 괄호왕이야!!
// https://www.acmicpc.net/problem/15926

import Foundation

let n = Int(readLine()!)!
let str = readLine()!.map { String($0) }

var ans = 0
var stack = [-1]
for i in 0..<n {
    if str[i] == "(" {
        stack.append(i)
    } else {
        stack.removeLast()
        if !stack.isEmpty {
            let length = i - stack.last!
            ans = max(ans, length)
        } else {
            stack.append(i)
        }
    }
}
print(ans)
