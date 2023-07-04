//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/04/04.
//
// 1949 : 우수 마을
// https://www.acmicpc.net/problem/1949

import Foundation

let n = Int(readLine()!)!
var cities = [0] + readLine()!.split(separator: " ").map { Int(String($0))! }
var tree = [[Int]](repeating: [], count: n+1)
for _ in 0 ..< n-1 {
    let ab = readLine()!.split(separator: " ").map { Int(String($0))! }
    tree[ab[0]].append(ab[1])
    tree[ab[1]].append(ab[0])
}

var visited = [Bool](repeating: false, count: n+1)
var dp = [[Int]](repeating: [0,0], count: n+1)
for i in 1 ... n { dp[i][1] = cities[i] }

func dfs(_ now: Int) {
    visited[now] = true
    
    for next in tree[now] {
        if !visited[next] {
            dfs(next)
            dp[now][0] += max(dp[next][0], dp[next][1])
            dp[now][1] += dp[next][0]
        }
    }
}

dfs(1)
//for i in dp { print(i) }
print(max(dp[1][0], dp[1][1]))
