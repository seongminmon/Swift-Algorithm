//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 1/8/25.
//
// 2193 : 이친수
// https://www.acmicpc.net/problem/2193

import Foundation

let n = Int(readLine()!)!

// dp[i][0] = 끝자리가 0인 i자리 이친수 개수
// dp[i][1] = 끝자리가 1인 i자리 이친수 개수

// dp[i][0] = dp[i-1][0] + dp[i-1][1]
// dp[i][1] = dp[i-1][0]
var dp = [[Int]](repeating: [Int](repeating: 0, count: 2), count: n+1)
dp[1][0] = 0
dp[1][1] = 1

for i in stride(from: 2, through: n, by: 1) {
    dp[i][0] = dp[i-1][0] + dp[i-1][1]
    dp[i][1] = dp[i-1][0]
}

print(dp[n][0] + dp[n][1])
