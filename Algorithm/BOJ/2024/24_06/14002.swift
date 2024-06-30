//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 6/30/24.
//
// 14002 : 가장 긴 증가하는 부분 수열 4
// https://www.acmicpc.net/problem/14002

import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int(String($0))! }

var dp = [Int](repeating: 1, count: n)
for i in 0..<n {
    for j in 0..<i {
        if arr[i] > arr[j] {
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
}

var ans = [Int]()
var maxValue = dp.max()!
print(maxValue)

for i in stride(from: n-1, through: 0, by: -1) {
    if dp[i] == maxValue {
        ans.append(arr[i])
        maxValue -= 1
    }
}
print(ans.reversed().map { String($0) }.joined(separator: " "))
