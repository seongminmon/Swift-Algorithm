//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/09/26.
//
// 1937 : 욕심쟁이 판다
// https://www.acmicpc.net/problem/1937

import Foundation

let n = Int(readLine()!)!
var graph = [[Int]]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph.append(input)
}

var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
func dfs(_ x: Int, _ y: Int) -> Int {
    if dp[x][y] != 0 { return dp[x][y] }
    
    dp[x][y] = 1

    let dx = [0,0,1,-1]
    let dy = [1,-1,0,0]

    for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]

        if 0 <= nx, nx < n, 0 <= ny, ny < n,
           graph[x][y] < graph[nx][ny] {
            dp[x][y] = max(dp[x][y], dfs(nx, ny) + 1)
        }
    }

    return dp[x][y]
}

var ans = 0
for i in 0..<n {
    for j in 0..<n {
        ans = max(ans, dfs(i, j))
    }
}
print(ans)
