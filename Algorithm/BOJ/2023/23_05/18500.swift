//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/05/15.
//
// 18500 : 미네랄 2
// https://www.acmicpc.net/problem/18500

import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,m) = (nm[0], nm[1])
var graph = [[String]]()
for _ in 0..<n {
    let input = readLine()!.map { String($0) }
    graph.append(input)
}
var k = Int(readLine()!)!
let heights = readLine()!.split(separator: " ").map { n - Int(String($0))! }

for h in 0..<k {
    let d = (h % 2 == 0) ? 1 : -1
    let tx = heights[h]
    var ty = (h % 2 == 0) ? 0 : m-1
    
    while 0 <= tx, tx < n, 0 <= ty, ty < m, graph[tx][ty] != "x" {
        ty += d
    }
    
    if ty < 0 || ty >= m { continue }
    
    graph[tx][ty] = "."
    
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    func bfs(_ sx: Int, _ sy: Int) -> [(Int,Int)] {
        let dx = [0,0,1,-1]
        let dy = [1,-1,0,0]
        
        visited[sx][sy] = true
        var queue = [(sx,sy)]
        var idx = 0
        
        while idx < queue.count {
            let (x,y) = queue[idx]
            idx += 1

            for i in 0..<4 {
                let nx = x + dx[i]
                let ny = y + dy[i]

                if 0 <= nx, nx < n, 0 <= ny, ny < m,
                   !visited[nx][ny], graph[nx][ny] == "x" {
                    visited[nx][ny] = true
                    queue.append((nx,ny))
                }
            }
        }
        
        for i in 0..<queue.count {
            if queue[i].0 == n-1 {
                return []
            }
        }
        
        return queue
    }
    
    var targetCluster = [(Int,Int)]()
    outerLoop: for i in 0..<n {
        for j in 0..<m {
            if !visited[i][j] && graph[i][j] == "x" {
                targetCluster = bfs(i, j)
                if !targetCluster.isEmpty {
                    break outerLoop
                }
            }
        }
    }
    
    if targetCluster.isEmpty { continue }
    
    for (x,y) in targetCluster {
        graph[x][y] = "."
    }
    
    var minCnt = n+1
    for (x,y) in targetCluster {
        var cnt = 0
        var nx = x
        
        while nx != n && graph[nx][y] != "x" {
            nx += 1
            cnt += 1
        }
        minCnt = min(minCnt, cnt-1)
    }
    for (x,y) in targetCluster {
        graph[x+minCnt][y] = "x"
    }
}

for g in graph { print(g.joined()) }
