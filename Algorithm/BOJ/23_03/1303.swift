//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/03/11.
//
// 1303 : 전쟁 - 전투
// https://www.acmicpc.net/problem/1303

import Foundation

let mn = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (m,n) = (mn[0], mn[1])
var graph = [[String]]()
for _ in 0 ..< n {
    let input = readLine()!.map{ String($0) }
    graph.append(input)
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
               !visited[nx][ny], graph[x][y] == graph[nx][ny] {
                queue.append((nx,ny))
                visited[nx][ny] = true
            }
        }
    }
    
    return queue.count
}

var wSum = 0
var bSum = 0
for i in 0 ..< n {
    for j in 0 ..< m {
        if !visited[i][j] {
            var power = bfs(i, j)
            power *= power
            if graph[i][j] == "W" {
                wSum += power
            } else {
                bSum += power
            }
        }
    }
}
print(wSum, bSum)
