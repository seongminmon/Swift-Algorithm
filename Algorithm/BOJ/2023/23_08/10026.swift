//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/08/31.
//
// 10026 : 적록색약
// https://www.acmicpc.net/problem/10026

import Foundation

let n = Int(readLine()!)!
var graph = [[String]]()
for _ in 0..<n {
    let input = readLine()!.map { String($0) }
    graph.append(input)
}

var ans = [0, 0]

var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
func bfs(_ sx: Int, _ sy: Int) {
    let dx = [0,0,1,-1]
    let dy = [1,-1,0,0]
    
    visited[sx][sy] = true
    let color = graph[sx][sy]
    var queue = [(sx, sy)]
    var idx = 0
    
    while idx < queue.count {
        let (x, y) = queue[idx]
        idx += 1
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if 0 <= nx, nx < n, 0 <= ny, ny < n,
               !visited[nx][ny], graph[nx][ny] == color {
                visited[nx][ny] = true
                queue.append((nx, ny))
            }
        }
    }
}

for i in 0..<n {
    for j in 0..<n {
        if !visited[i][j] {
            bfs(i, j)
            ans[0] += 1
        }
    }
}

for i in 0..<n {
    for j in 0..<n {
        if graph[i][j] == "G" {
            graph[i][j] = "R"
        }
    }
}

visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
for i in 0..<n {
    for j in 0..<n {
        if !visited[i][j] {
            bfs(i, j)
            ans[1] += 1
        }
    }
}

print(ans[0], ans[1])
