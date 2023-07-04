//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/01/09.
//
// 2234 : 성곽
// https://www.acmicpc.net/problem/2234

import Foundation

let mn = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (m,n) = (mn[0], mn[1])

var graph = [[Int]]()
for _ in 0 ..< n {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    graph.append(input)
}

let dx = [0, -1, 0, 1]
let dy = [-1, 0, 1, 0]

var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)

func bfs(_ sx: Int, _ sy: Int) -> Int {
    var queue = [(sx,sy)]
    var idx = 0
    visited[sx][sy] = true
    
    while idx < queue.count {
        let (x,y) = queue[idx]
        idx += 1
        
        var wall = 1
        for i in 0 ..< 4 {
            if graph[x][y] & wall != wall {
                let nx = x + dx[i]
                let ny = y + dy[i]
                
                if 0 <= nx, nx < n, 0 <= ny, ny < m,
                !visited[nx][ny] {
                    visited[nx][ny] = true
                    queue.append((nx,ny))
                }
            }
            wall *= 2
        }
    }
    
    return queue.count
}

var roomCnt = 0
var maxSize = 0
for i in 0 ..< n {
    for j in 0 ..< m {
        if !visited[i][j] {
            maxSize = max(maxSize, bfs(i, j))
            roomCnt += 1
        }
    }
}

var twoRoomMaxSize = 0
for i in 0 ..< n {
    for j in 0 ..< m {
        var wall = 1
        while wall <= 8 {
            if graph[i][j] & wall == wall {
                visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
                graph[i][j] = graph[i][j] - wall
                twoRoomMaxSize = max(twoRoomMaxSize, bfs(i,j))
                graph[i][j] = graph[i][j] + wall
            }
            wall *= 2
        }
    }
}

print(roomCnt)
print(maxSize)
print(twoRoomMaxSize)
