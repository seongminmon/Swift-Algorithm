//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 5/8/24.
//
// 2670 : 연속부분최대곱
// https://www.acmicpc.net/problem/2670

import Foundation

let n = Int(readLine()!)!
var arr = [Double]()
for _ in 0..<n {
    arr.append(Double(readLine()!)!)
}

var dp = [Double](repeating: 0, count: n)
dp[0] = arr[0]
for i in 1..<n {
    dp[i] = max(arr[i], dp[i-1] * arr[i])
}
print(String(format: "%.3f", dp.max()!))
