//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/04.
//
// 1149 : RGB거리
// https://www.acmicpc.net/problem/1149

import Foundation

// 입력
let n = Int(readLine()!)!
var cost = [[0,0,0]]
for _ in 1 ... n {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    cost.append(input)
}

// 풀이
var dp = [[Int]](repeating: [Int](repeating: 0, count: 3), count: n+1)
for i in 1 ... n {
    dp[i][0] = cost[i][0] + min(dp[i-1][1], dp[i-1][2])
    dp[i][1] = cost[i][1] + min(dp[i-1][0], dp[i-1][2])
    dp[i][2] = cost[i][2] + min(dp[i-1][0], dp[i-1][1])
}

// 출력
let result = dp[n].min()!
print(result)
