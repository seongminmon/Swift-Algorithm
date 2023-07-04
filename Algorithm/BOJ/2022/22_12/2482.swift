//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/19.
//
// 2482 : 색상환
// https://www.acmicpc.net/problem/2482

import Foundation

// 입력
let n = Int(readLine()!)!
let k = Int(readLine()!)!

// 풀이
let mod = 1_000_000_003
var dp = [[Int]](repeating: [Int](repeating: 0, count: n+1), count: n+1)
for i in 1 ... n {
    dp[i][1] = i
}

for i in 4 ... n {
    for j in 2 ... i/2 {
        dp[i][j] = (dp[i-1][j] + dp[i-2][j-1]) % mod
    }
}

// 출력
print(dp[n][k])
