//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/10/31.
//
// 2631 : 줄세우기
// https://www.acmicpc.net/problem/2631

import Foundation

let n = Int(readLine()!)!
var arr = [Int]()
for _ in 0..<n {
    arr.append(Int(readLine()!)!)
}

var dp = [Int](repeating: 1, count: n)
for i in 0..<n {
    for j in 0..<i {
        if arr[i] > arr[j] {
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
}
print(n - dp.max()!)
