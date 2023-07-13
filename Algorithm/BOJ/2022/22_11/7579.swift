//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/11/30.
//
// 7579 : 앱
// https://www.acmicpc.net/problem/7579

import Foundation

// 입력
let nm = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,m) = (nm[0], nm[1])
var memory = readLine()!.split(separator: " ").map{ Int(String($0))! }
var cost = readLine()!.split(separator: " ").map{ Int(String($0))! }
memory.insert(0, at: 0)
cost.insert(0, at: 0)

// 풀이
let MAX = cost.reduce(0, +)
var dp = [[Int]](repeating: [Int](repeating: 0, count: MAX+1), count: n+1)
for i in 1 ... n {
    for j in 1 ... MAX {
        if j >= cost[i] {
            dp[i][j] = max(dp[i-1][j],
            dp[i-1][j - cost[i]] + memory[i])
        } else {
            dp[i][j] = dp[i-1][j]
        }
    }
}

// 출력
for i in 0 ... MAX {
    if dp[n][i] >= m {
        print(i)
        break
    }
}
