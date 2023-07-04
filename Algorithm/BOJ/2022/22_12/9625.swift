//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/17.
//
// 9625 : BABBA
// https://www.acmicpc.net/problem/9625

import Foundation

let k = Int(readLine()!)!

var dp = [[Int]](repeating: [Int](repeating: 0, count: 2), count: k+1)
dp[0] = [1,0]
for i in 1 ... k {
    dp[i][0] = dp[i-1][1]
    dp[i][1] = dp[i-1][1] + dp[i-1][0]
}

for i in dp[k] {
    print(i, terminator: " ")
}
