//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/10/01.
//
// 1520 : 내리막 길
// https://www.acmicpc.net/problem/1520

import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,m) = (nm[0], nm[1])

var graph = [[Int]]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph.append(input)
}

let dx = [0,0,1,-1]
let dy = [1,-1,0,0]

// dp[i][j] : graph[i][j]에서 graph[n-1][m-1]까지 갈 수 있는 경로의 수
var dp = [[Int]](repeating: [Int](repeating: -1, count: m), count: n)
func dfs(_ x: Int, _ y: Int) -> Int {
    // 종료 조건
    if (x,y) == (n-1, m-1) { return 1 }
    // 재방문
    if dp[x][y] != -1 { return dp[x][y] }
    
    dp[x][y] = 0
    for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]

        if 0 <= nx, nx < n, 0 <= ny, ny < m,
            graph[nx][ny] < graph[x][y] {
            dp[x][y] += dfs(nx, ny)
        }
    }

    return dp[x][y]
}

print(dfs(0, 0))
