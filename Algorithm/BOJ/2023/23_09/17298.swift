//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/09/04.
//
// 17298 : 오큰수
// https://www.acmicpc.net/problem/17298

import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int(String($0))! }

var stack = [Int]()
var ans = [Int]()
for i in stride(from: n-1, through: 0, by: -1) {
    while !stack.isEmpty && stack.last! <= arr[i] {
        stack.removeLast()
    }
    
    if stack.isEmpty {
        ans.append(-1)
    } else {
        ans.append(stack.last!)
    }
    
    stack.append(arr[i])
}

print(ans.reversed().map { String($0) }.joined(separator: " "))
