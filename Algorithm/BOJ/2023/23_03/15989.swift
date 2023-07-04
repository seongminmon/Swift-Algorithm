//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/03/14.
//
// 15989 : 1, 2, 3 더하기 4
// https://www.acmicpc.net/problem/15989

import Foundation

let t = Int(readLine()!)!

var dp = [[Int]](repeating: [Int](repeating: 0, count: 3), count: 10001)
for i in 1 ... 3 {
    for j in 0 ..< i {
        dp[i][j] = 1
    }
}

for i in 4 ..< 10001 {
    dp[i][0] = dp[i-1][0]
    dp[i][1] = dp[i-2][0] + dp[i-2][1]
    dp[i][2] = dp[i-3][0] + dp[i-3][1] + dp[i-3][2]
}

for _ in 0 ..< t {
    let n = Int(readLine()!)!
    print(dp[n][0] + dp[n][1] + dp[n][2])
}
