//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/09/05.
//
// 2493 : 탑
// https://www.acmicpc.net/problem/2493

import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int(String($0))! }

var stack = [(Int, Int)]()  // (높이, 번호)
var result = [Int]()
for i in 0..<n {
    while !stack.isEmpty && stack.last!.0 < arr[i] {
        stack.removeLast()
    }
    
    if stack.isEmpty {
        result.append(0)
    } else {
        result.append(stack.last!.1)
    }
    
    stack.append((arr[i], i+1))
}

print(result.map { String($0) }.joined(separator: " "))
