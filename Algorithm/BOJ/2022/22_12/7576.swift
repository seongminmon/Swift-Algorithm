//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/04.
//
// 7576 : 토마토
// https://www.acmicpc.net/problem/7576

import Foundation

// 입력
let mn = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,m) = (mn[1], mn[0])
var graph = [[Int]]()
for _ in 0 ..< n {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    graph.append(input)
}

// 풀이
let dx = [0,0,1,-1]
let dy = [1,-1,0,0]

var tomatoCnt = 0
for i in 0 ..< n {
    for j in 0 ..< m {
        if graph[i][j] == 0 {
            tomatoCnt += 1
        }
    }
}

var queue = [(Int,Int)]()
var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
for i in 0 ..< n {
    for j in 0 ..< m {
        if graph[i][j] == 1, !visited[i][j] {
            queue.append((i,j))
            visited[i][j] = true
        }
    }
}

var check = true

func bfs() -> [(Int,Int)] {
    var idx = 0
    
    var nextQueue = [(Int,Int)]()
    while idx < queue.count {
        let (x,y) = queue[idx]
        idx += 1
        
        for d in 0 ..< 4 {
            let nx = x + dx[d]
            let ny = y + dy[d]
            
            if 0 <= nx, nx < n, 0 <= ny, ny < m,
               graph[nx][ny] == 0 {
                nextQueue.append((nx,ny))
                graph[nx][ny] = 1
                tomatoCnt -= 1
            }
        }
    }
    
    if nextQueue.isEmpty {
        check = false
    }
    
    return nextQueue
}

// 출력
var result = 0
while tomatoCnt > 0, check {
    queue = bfs()
    result += 1
}
print(check ? result : -1)
