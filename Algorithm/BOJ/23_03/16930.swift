//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/03/12.
//
// 16930 : 달리기
// https://www.acmicpc.net/problem/16930

import Foundation

let nmk = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,m,k) = (nmk[0], nmk[1], nmk[2])

var graph = [[String]]()
for _ in 0 ..< n {
    let input = readLine()!.map{ String($0) }
    graph.append(input)
}

let se = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (x1,y1,x2,y2) = (se[0]-1, se[1]-1, se[2]-1, se[3]-1)

let dx = [0,0,1,-1]
let dy = [1,-1,0,0]

var visited = [[Int]](repeating: [Int](repeating: Int.max, count: m), count: n)
visited[x1][y1] = 0
var queue = [(x1,y1)]
var idx = 0

while idx < queue.count {
    let (x,y) = queue[idx]
    idx += 1
    
    if (x,y) == (x2,y2) { break }
    
    for i in 0 ..< 4 {
        var nx = x + dx[i]
        var ny = y + dy[i]
        
        for _ in 0 ..< k {
            if 0 <= nx, nx < n, 0 <= ny, ny < m,
               graph[nx][ny] == ".",
               visited[nx][ny] > visited[x][y] {
                if visited[nx][ny] == Int.max {
                    visited[nx][ny] = visited[x][y] + 1
                    queue.append((nx,ny))
                }
            } else {
                break
            }
            
            nx += dx[i]
            ny += dy[i]
        }
    }
}

print(visited[x2][y2] == Int.max ? -1 : visited[x2][y2])
