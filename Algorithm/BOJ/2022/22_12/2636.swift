//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/06.
//
// 2636 : 치즈
// https://www.acmicpc.net/problem/2636

import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,m) = (nm[0], nm[1])

var graph = [[Int]]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph.append(input)
}

let dx = [0,0,1,-1]
let dy = [1,-1,0,0]

func bfs() -> Int {
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    visited[0][0] = true
    var queue = [(0,0)]
    var idx = 0
    
    var cheese = [(Int,Int)]()
    while idx < queue.count {
        let (x,y) = queue[idx]
        idx += 1
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if 0 <= nx, nx < n, 0 <= ny, ny < m, !visited[nx][ny] {
                if graph[nx][ny] == 0 {
                    queue.append((nx,ny))
                } else {
                    cheese.append((nx,ny))
                }
                visited[nx][ny] = true
            }
        }
    }
    
    for (x,y) in cheese {
        graph[x][y] = 0
    }
    
    return cheese.count
}

var time = 0
var prev = 0
while true {
    let cnt = bfs()
    if cnt == 0 {
        break
    }
    prev = cnt
    time += 1
}
print(time)
print(prev)
