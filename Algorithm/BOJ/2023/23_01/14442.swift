//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/01/15.
//
// 14442 : 벽 부수고 이동하기 2
// https://www.acmicpc.net/problem/14442

import Foundation

let nmk = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,m,k) = (nmk[0], nmk[1], nmk[2])
var graph = [[Int]]()
for _ in 0 ..< n {
    let input = readLine()!.map{ Int(String($0))! }
    graph.append(input)
}

let dx = [0,0,1,-1]
let dy = [1,-1,0,0]
func bfs() -> Int {
    var visited = [[Int]](repeating: [Int](repeating: k+1, count: m), count: n)
    visited[0][0] = 0
    
    var queue = [(0,0,1)]   // (x,y,dist)
    var idx = 0
    
    while idx < queue.count {
        let (x,y,dist) = queue[idx]
        idx += 1
        
        if (x,y) == (n-1, m-1) {
            return dist
        }
        
        for i in 0 ..< 4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if nx < 0 || nx >= n || ny < 0 || ny >= m {
                continue
            }
            
            let cnt = visited[x][y] + graph[nx][ny]
            
            if cnt >= visited[nx][ny] || cnt > k {
                continue
            }
            
            visited[nx][ny] = cnt
            queue.append((nx, ny, dist + 1))
        }
    }
    
    return -1
}

print(bfs())
