//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/10/28.
//
// 4179 : 불!
// https://www.acmicpc.net/problem/4179

import Foundation

let rc = readLine()!.split(separator: " ").map { Int(String($0))! }
let (r,c) = (rc[0], rc[1])

var graph = [[String]]()
for _ in 0..<r {
    let input = readLine()!.map { String($0) }
    graph.append(input)
}

var start = (0,0)
var fireQueue = [(Int,Int)]()
for i in 0..<r {
    for j in 0..<c {
        if graph[i][j] == "J" {
            graph[i][j] = "."
            start = (i,j)
        } else if graph[i][j] == "F" {
            fireQueue.append((i,j))
        }
    }
}

let dx = [0,0,1,-1]
let dy = [1,-1,0,0]

var fireVisited = [[Int]](repeating: [Int](repeating: Int.max, count: c), count: r)
for (x,y) in fireQueue {
    fireVisited[x][y] = 0
}
var fireIdx = 0

while fireIdx < fireQueue.count {
    let (x,y) = fireQueue[fireIdx]
    fireIdx += 1
    
    for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        
        if 0 <= nx, nx < r, 0 <= ny, ny < c,
           fireVisited[nx][ny] > fireVisited[x][y] + 1,
            graph[nx][ny] == "." {
            fireVisited[nx][ny] = fireVisited[x][y] + 1
            fireQueue.append((nx,ny))
        }
    }
}

func move() -> Int {
    var visited = [[Int]](repeating: [Int](repeating: Int.max, count: c), count: r)
    visited[start.0][start.1] = 0
    var queue = [start]
    var idx = 0
    
    while idx < queue.count {
        let (x,y) = queue[idx]
        idx += 1
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if 0 <= nx, nx < r, 0 <= ny, ny < c {
                if visited[nx][ny] > visited[x][y] + 1,
                    fireVisited[nx][ny] > visited[x][y] + 1,
                   graph[nx][ny] == "." {
                    visited[nx][ny] = visited[x][y] + 1
                    queue.append((nx,ny))
                }
            } else {
                // 탈출 성공
                return visited[x][y] + 1
            }
        }
    }
    // 탈출 실패
    return -1
}

let ans = move()
print(ans == -1 ? "IMPOSSIBLE" : ans)
