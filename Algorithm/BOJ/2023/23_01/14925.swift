//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/01/15.
//
// 14925 : 목장 건설하기
// https://www.acmicpc.net/problem/14925

import Foundation

let nm = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,m) = (nm[0], nm[1])
var graph = [[Int]]()
for _ in 0 ..< n {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    graph.append(input)
}

var dp = [[Int]](repeating: [Int](repeating: 0, count: m+1), count: n+1)
var result = 0
for i in 1 ... n {
    for j in 1 ... m {
        if graph[i-1][j-1] == 0 {
            dp[i][j] = min(dp[i-1][j], dp[i][j-1], dp[i-1][j-1]) + 1
            result = max(result, dp[i][j])
        }
    }
}
print(result)
