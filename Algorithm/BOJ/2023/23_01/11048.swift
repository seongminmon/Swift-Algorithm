//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/01/13.
//
// 11048 : 이동하기
// https://www.acmicpc.net/problem/11048

import Foundation

let nm = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,m) = (nm[0], nm[1])
var graph = [[Int]]()
for _ in 0 ..< n {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    graph.append(input)
}

var dp = graph
for i in 1 ..< n { dp[i][0] += dp[i-1][0] }
for j in 1 ..< m { dp[0][j] += dp[0][j-1] }
for i in 1 ..< n {
    for j in 1 ..< m {
        dp[i][j] += max(dp[i-1][j], dp[i][j-1], dp[i-1][j-1])
    }
}
print(dp[n-1][m-1])
