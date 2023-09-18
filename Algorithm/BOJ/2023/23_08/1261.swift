//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/09/17.
//
// 1261 : 알고스팟
// https://www.acmicpc.net/problem/1261

import Foundation

let mn = readLine()!.split(separator: " ").map { Int(String($0))! }
let (m,n) = (mn[0], mn[1])
var graph = [[Int]]()
for _ in 0..<n {
    let input = readLine()!.map { Int(String($0))! }
    graph.append(input)
}

let dx = [0,0,1,-1]
let dy = [1,-1,0,0]

var visited = [[Int]](repeating: [Int](repeating: Int.max, count: m), count: n)
visited[0][0] = 0
var queue = [(0,0)]
var idx = 0

while idx < queue.count {
    let (x,y) = queue[idx]
    idx += 1
    
    for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        
        if 0 <= nx, nx < n, 0 <= ny, ny < m {
            let nextCnt = graph[nx][ny] == 1 ? visited[x][y] + 1 : visited[x][y]
            if visited[nx][ny] > nextCnt {
                visited[nx][ny] = nextCnt
                queue.append((nx, ny))
            }
        }
    }
}

print(visited[n-1][m-1])
