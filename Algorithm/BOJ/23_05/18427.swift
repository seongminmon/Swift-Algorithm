//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/06/05.
//
// 18427 : 함께 블록 쌓기
// https://www.acmicpc.net/problem/18427

import Foundation

let nmh = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,m,h) = (nmh[0], nmh[1], nmh[2])

var blocks = [[Int]](repeating: [], count: n+1)
for i in 1...n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    blocks[i] = input
}

var dp = [[Int]](repeating: [Int](repeating: 0, count: h+1), count: n+1)
dp[0][0] = 1

for i in 1...n {
    dp[i] = dp[i-1]
    for block in blocks[i] {
        if block > h { continue }
        for j in block...h {
            dp[i][j] += dp[i-1][j-block]
            dp[i][j] %= 10007
        }
    }
}

print(dp[n][h])
