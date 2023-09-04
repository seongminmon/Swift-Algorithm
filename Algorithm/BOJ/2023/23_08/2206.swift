//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/08/31.
//
// 2206 : 벽 부수고 이동하기
// https://www.acmicpc.net/problem/2206

import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,m) = (nm[0], nm[1])

var graph = [[Int]]()
for _ in 0..<n {
    let input = readLine()!.map { Int(String($0))! }
    graph.append(input)
}

let dx = [0,0,1,-1]
let dy = [1,-1,0,0]

var dist = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: -1, count: 2), count: m), count: n)
dist[0][0][0] = 1

var queue = [(Int, Int, Int)]()
queue.append((0, 0, 0))
var idx = 0

var ans = -1
while idx < queue.count {
    let (x, y, wall) = queue[idx]
    idx += 1
    
    // 조기 탈출
    if (x, y) == (n-1, m-1) {
        ans = dist[x][y][wall]
        break
    }
    
    for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        
        if 0 <= nx, nx < n, 0 <= ny, ny < m {
            let nextWall = graph[nx][ny] == 0 ? wall : wall + 1
            
            if nextWall <= 1 && dist[nx][ny][nextWall] == -1 {
                dist[nx][ny][nextWall] = dist[x][y][wall] + 1
                queue.append((nx, ny, nextWall))
            }
        }
    }
}

print(ans)
