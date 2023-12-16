//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/06/03.
//
// 1189 : 컴백홈
// https://www.acmicpc.net/problem/1189

import Foundation

let nmk = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,m,k) = (nmk[0], nmk[1], nmk[2])

var graph = [[String]]()
for _ in 0..<n {
    let input = readLine()!.map { String($0) }
    graph.append(input)
}

let dx = [0,0,1,-1]
let dy = [1,-1,0,0]

var ans = 0
var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
func dfs(_ x: Int, _ y: Int, _ dist: Int) {
    if dist == k {
        if (x,y) == (0, m-1) {
            ans += 1
        }
        return
    }
    
    for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        
        if 0 <= nx, nx < n, 0 <= ny, ny < m,
           !visited[nx][ny], graph[nx][ny] == "." {
            visited[nx][ny] = true
            dfs(nx, ny, dist+1)
            visited[nx][ny] = false
        }
    }
}

visited[n-1][0] = true
dfs(n-1, 0, 1)

print(ans)

