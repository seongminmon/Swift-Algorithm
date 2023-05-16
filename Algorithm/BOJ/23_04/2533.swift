//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/04/03.
//
// 2533 : 사회망 서비스(SNS)
// https://www.acmicpc.net/problem/2533

import Foundation

let n = Int(readLine()!)!
var tree = [[Int]](repeating: [], count: n+1)
for _ in 0 ..< n-1 {
    let uv = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let (u,v) = (uv[0], uv[1])
    tree[u].append(v)
    tree[v].append(u)
}

var visited = [Bool](repeating: false, count: n+1)
var dp = [[Int]](repeating: [0,1], count: n+1)
func dfs(_ now: Int) {
    visited[now] = true
    
    for next in tree[now] {
        if !visited[next] {
            dfs(next)
            dp[now][0] += dp[next][1]
            dp[now][1] += min(dp[next][0], dp[next][1])
        }
    }
}

dfs(1)
print(min(dp[1][0], dp[1][1]))
