//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/01/07.
//
// 2589 : 보물섬
// https://www.acmicpc.net/problem/2589

import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,m) = (nm[0], nm[1])

var graph = [[String]]()
for _ in 0..<n {
    let input = readLine()!.map { String($0) }
    graph.append(input)
}

func bfs(_ sx: Int, _ sy: Int) -> Int {
    let dx = [0,0,1,-1]
    let dy = [1,-1,0,0]
    
    var visited = [[Int]](repeating: [Int](repeating: Int.max, count: m), count: n)
    visited[sx][sy] = 0
    var queue = [(sx,sy)]
    var idx = 0
    
    var ret = 0
    while idx < queue.count {
        let (x,y) = queue[idx]
        idx += 1
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if 0 <= nx, nx < n, 0 <= ny, ny < m,
               visited[nx][ny] > visited[x][y] + 1,
               graph[nx][ny] == "L" {
                visited[nx][ny] = visited[x][y] + 1
                queue.append((nx,ny))
                ret = max(ret, visited[nx][ny])
            }
        }
    }
    
    return ret
}

var ans = 0
for i in 0..<n {
    for j in 0..<m {
        if graph[i][j] == "L" {
            ans = max(ans, bfs(i, j))
        }
    }
}
print(ans)
