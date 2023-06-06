//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/03/13.
//
// 1890 : 점프
// https://www.acmicpc.net/problem/1890

import Foundation

let n = Int(readLine()!)!
var graph = [[Int]]()
for _ in 0 ..< n {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    graph.append(input)
}

var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
dp[0][0] = 1
for i in 0 ..< n {
    for j in 0 ..< n {
        if dp[i][j] == 0 || (i,j) == (n-1,n-1) {
            continue
        }
        
        let num = graph[i][j]
        if i + num < n {
            dp[i + num][j] += dp[i][j]
        }
        if j + num < n {
            dp[i][j + num] += dp[i][j]
        }
    }
}
print(dp[n-1][n-1])
