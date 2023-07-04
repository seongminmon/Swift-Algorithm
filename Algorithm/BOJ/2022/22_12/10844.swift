//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/10.
//
// 10844 : 쉬운 계단 수
// https://www.acmicpc.net/problem/10844

import Foundation

// 입력
let n = Int(readLine()!)!

// 풀이
var dp = [[Int]](repeating: [Int](repeating: 0, count: 10), count: n)
for j in 0 ... 9 {
    dp[0][j] = 1
}

for i in 1 ..< n {
    for j in 0 ... 9 {
        if j == 0 {
            dp[i][j] = dp[i-1][j+1]
        } else if j == 9 {
            dp[i][j] = dp[i-1][j-1]
        } else {
            dp[i][j] = dp[i-1][j-1] + dp[i-1][j+1]
        }
        dp[i][j] %= Int(1e9)
    }
}

// 출력
var result = 0
for j in 1 ... 9 {
    result += dp[n-1][j]
    result %= Int(1e9)
}
print(result)
