//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/04.
//
// 7569 : 토마토
// https://www.acmicpc.net/problem/7569

import Foundation

// 입력
let mnh = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (m,n,h) = (mnh[0], mnh[1], mnh[2])

var graph = [[[Int]]]()
for _ in 0 ..< h {
    var temp = [[Int]]()
    for _ in 0 ..< n {
        let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
        temp.append(input)
    }
    graph.append(temp)
}

// 풀이
let dz = [1, -1, 0, 0, 0, 0]
let dx = [0, 0, 1, -1, 0, 0]
let dy = [0, 0, 0, 0, 1, -1]

var tomatoCnt = 0   // 안 익은 토마토 개수
var queue = [(Int,Int,Int)]()   // 익은 토마토
var visited = [[[Bool]]](repeating: [[Bool]](repeating: [Bool](repeating: false, count: m), count: n), count: h)

for k in 0 ..< h {
    for i in 0 ..< n {
        for j in 0 ..< m {
            if graph[k][i][j] == 0 {
                tomatoCnt += 1
            } else if graph[k][i][j] == 1 {
                queue.append((k,i,j))
                visited[k][i][j] = true
            }
        }
    }
}

func bfs() -> [(Int,Int,Int)] {
    var idx = 0
    var nextQueue = [(Int,Int,Int)]()
    
    while idx < queue.count {
        let (z, x, y) = queue[idx]
        idx += 1
        
        for d in 0 ..< 6 {
            let nz = z + dz[d]
            let nx = x + dx[d]
            let ny = y + dy[d]
            
            if 0 <= nz, nz < h, 0 <= nx, nx < n, 0 <= ny, ny < m,
            graph[nz][nx][ny] == 0 {
                nextQueue.append((nz,nx,ny))
                visited[nz][nx][ny] = true
                
                graph[nz][nx][ny] = 1
                tomatoCnt -= 1
            }
        }
    }
    
    return nextQueue
}

// 출력
var result = 0
while tomatoCnt > 0 {
    queue = bfs()
    result += 1
    if queue.isEmpty {
        break
    }
}
print(tomatoCnt == 0 ? result : -1)
