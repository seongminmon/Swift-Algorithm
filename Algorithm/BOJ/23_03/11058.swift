//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/03/15.
//
// 11058 : 크리보드
// https://www.acmicpc.net/problem/11058

import Foundation

let n = Int(readLine()!)!

var dp = [Int](repeating: 0, count: n+1)
for i in 1 ... n {
    if i <= 6 {
        dp[i] = i
    } else {
        for j in stride(from: 3, through: n, by: 1) {
            if i-j > 0 {
                dp[i] = max(dp[i], dp[i-j] * (j-1))
            }
        }
    }
}
print(dp[n])
