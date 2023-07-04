//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/14.
//
// 2225 : 합분해
// https://www.acmicpc.net/problem/2225

import Foundation

// 입력
let nk = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,k) = (nk[0], nk[1])

// 풀이
var dp = [[Int]](repeating: [Int](repeating: 0, count: k+1), count: n+1)
for j in 1 ... k { dp[0][j] = 1 }

for i in 1 ... n {
    for j in 1 ... k {
        dp[i][j] = (dp[i][j-1] + dp[i-1][j]) % Int(1e9)
    }
}

// 출력
print(dp[n][k])
