//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/01/29.
//
// 4963 : 섬의 개수
// https://www.acmicpc.net/problem/4963

import Foundation

while let t = readLine() {
    let mn = t.split(separator: " ").map{ Int(String($0))! }
    let (m,n) = (mn[0], mn[1])
    
    if n == 0, m == 0 {
        break
    }
    
    var graph = [[Int]]()
    for _ in 0 ..< n {
        let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
        graph.append(input)
    }
    
    let dx = [0,0,1,1,1,-1,-1,-1]
    let dy = [1,-1,0,1,-1,0,1,-1]
    
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    func bfs(_ sx: Int, _ sy: Int) -> [(Int,Int)] {
        visited[sx][sy] = true
        var queue = [(sx,sy)]
        var idx = 0
        
        while idx < queue.count {
            let (x,y) = queue[idx]
            idx += 1
            
            for i in 0 ..< 8 {
                let nx = x + dx[i]
                let ny = y + dy[i]
                
                if 0 <= nx, nx < n, 0 <= ny, ny < m,
                   !visited[nx][ny], graph[nx][ny] != 0 {
                    visited[nx][ny] = true
                    queue.append((nx,ny))
                }
            }
        }
        
        return queue
    }
    
    var unions = [[(Int,Int)]]()
    for i in 0 ..< n {
        for j in 0 ..< m {
            if !visited[i][j], graph[i][j] != 0 {
                unions.append(bfs(i, j))
            }
        }
    }
    print(unions.count)
}
