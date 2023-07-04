//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/03/11.
//
// 1743 : 음식물 피하기
// https://www.acmicpc.net/problem/1743

import Foundation

let nmk = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,m,k) = (nmk[0], nmk[1], nmk[2])
var graph = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
for _ in 0 ..< k {
    let xy = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let (x,y) = (xy[0]-1, xy[1]-1)
    graph[x][y] = 1
}

let dx = [0,0,1,-1]
let dy = [1,-1,0,0]

var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
func bfs(_ sx: Int, _ sy: Int) -> Int {
    visited[sx][sy] = true
    var queue = [(sx,sy)]
    var idx = 0
    
    while idx < queue.count {
        let (x,y) = queue[idx]
        idx += 1
        
        for i in 0 ..< 4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if 0 <= nx, nx < n, 0 <= ny, ny < m,
               !visited[nx][ny], graph[nx][ny] == 1 {
                queue.append((nx,ny))
                visited[nx][ny] = true
            }
        }
    }
    
    return queue.count
}

var result = 0
for i in 0 ..< n {
    for j in 0 ..< m {
        if !visited[i][j], graph[i][j] == 1 {
            result = max(result, bfs(i, j))
        }
    }
}
print(result)
