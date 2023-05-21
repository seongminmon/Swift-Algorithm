//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/05/21.
//
// 17182 : 우주 탐사선
// https://www.acmicpc.net/problem/17182

import Foundation

let nk = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,k) = (nk[0], nk[1])

var dist = [[Int]]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    dist.append(input)
}

for k in 0..<n {
    for i in 0..<n {
        for j in 0..<n {
            dist[i][j] = min(dist[i][j], dist[i][k] + dist[k][j])
        }
    }
}

var ans = Int.max
var visited = [Bool](repeating: false, count: n)
visited[k] = true
func dfs(_ depth: Int, _ now: Int, _ cost: Int) {
    if ans < cost { return }
    
    if depth == n {
        ans = min(ans, cost)
        return
    }
    
    for i in 0..<n {
        if !visited[i] {
            visited[i] = true
            dfs(depth+1, i, cost + dist[now][i])
            visited[i] = false
        }
    }
}

dfs(1, k, 0)

print(ans)
