//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/02/19.
//
// 2504 : 괄호의 값
// https://www.acmicpc.net/problem/2504

import Foundation

let str = readLine()!.map{ String($0) }

var stack = [String]()
var isRight = true
var result = 0
var temp = 1

for i in 0 ..< str.count {
    if str[i] == "(" {
        stack.append(str[i])
        temp *= 2
    } else if str[i] == "[" {
        stack.append(str[i])
        temp *= 3
    } else if str[i] == ")" {
        if stack.isEmpty || stack.last != "(" {
            isRight = false
            break
        }
        if str[i-1] == "(" {
            result += temp
        }
        stack.removeLast()
        temp /= 2
    } else {
        if stack.isEmpty || stack.last != "[" {
            isRight = false
            break
        }
        if str[i-1] == "[" {
            result += temp
        }
        stack.removeLast()
        temp /= 3
    }
}

if !isRight || !stack.isEmpty {
    print(0)
} else {
    print(result)
}
