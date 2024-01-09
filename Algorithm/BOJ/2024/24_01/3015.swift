//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 1/7/24.
//
// 3015 : 오아시스 재결합
// https://www.acmicpc.net/problem/3015

import Foundation

let n = Int(readLine()!)!
var stack = [(Int,Int)]()   // (키, 중복 개수)
var ans: Int64 = 0
for _ in 0..<n {
    let height = Int(readLine()!)!
    var cnt = 1
    while let last = stack.last, last.0 <= height {
        ans += Int64(last.1)
        cnt = (last.0 == height) ? last.1 + 1 : 1
        stack.removeLast()
    }
    if !stack.isEmpty { ans += 1 }
    stack.append((height, cnt))
    print(stack, ans)
}
print(ans)
