//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/03.
//
// 10828 : 스택
// https://www.acmicpc.net/problem/10828

import Foundation

// 입력
let n = Int(readLine()!)!
var orders = [[String]]()
for _ in 0 ..< n {
    let input = readLine()!.split(separator: " ").map{ String($0) }
    orders.append(input)
}

// 풀이 + 출력
var stack = [Int]()
for str in orders {
    switch str[0] {
    case "push" : stack.append(Int(str[1])!)
    case "pop" :
        if stack.last != nil {
            print(stack.removeLast())
        } else {
            print(-1)
        }
    case "size" : print( stack.count )
    case "empty" : print( stack.isEmpty ? 1 : 0 )
    case "top" :
        if let a = stack.last {
            print(a)
        } else {
            print(-1)
        }
    default: break
    }
}
