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

var ans = [Int](repeating: -1, count: n)
var stack = [Int]()
for i in 0..<n {
    while let last = stack.last, arr[last] < arr[i] {
        ans[last] = arr[i]
        stack.removeLast()
    }
    stack.append(i)
}
print(ans.map { String($0) }.joined(separator: " "))
