//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 11/28/23.
//
// 1012 : 유기농 배추
// https://www.acmicpc.net/problem/1012

import Foundation

let t = Int(readLine()!)!
for _ in 0..<t {
    let mnk = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (m,n,k) = (mnk[0], mnk[1], mnk[2])
    
    var graph = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
    for _ in 0..<k {
        let yx = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (y,x) = (yx[0], yx[1])
        graph[x][y] = 1
    }

    let dx = [0,0,1,-1]
    let dy = [1,-1,0,0]

    var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    func bfs(_ sx: Int, _ sy: Int) {
        visited[sx][sy] = true
        var queue = [(sx,sy)]
        var idx = 0

        while idx < queue.count {
            let (x,y) = queue[idx]
            idx += 1
            
            if (x,y) == (n-1,m-1) {
                break
            }
            
            for i in 0..<4 {
                let nx = x + dx[i]
                let ny = y + dy[i]
                
                if 0 <= nx, nx < n, 0 <= ny, ny < m,
                   !visited[nx][ny], graph[nx][ny] == 1 {
                    visited[nx][ny] = true
                    queue.append((nx,ny))
                }
            }
        }
    }
    
    var ans = 0
    for i in 0..<n {
        for j in 0..<m {
            if !visited[i][j] && graph[i][j] == 1 {
                bfs(i, j)
                ans += 1
            }
        }
    }
    print(ans)
}
