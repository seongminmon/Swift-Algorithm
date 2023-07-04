//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/20.
//
// 2573 : 빙산
// https://www.acmicpc.net/problem/2573

import Foundation

// 입력
let nm = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,m) = (nm[0], nm[1])
var graph = [[Int]]()
for _ in 0 ..< n {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    graph.append(input)
}

// 풀이
let dx = [0,0,1,-1]
let dy = [1,-1,0,0]

var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
var count = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
func bfs(_ sx: Int, _ sy: Int) -> [(Int,Int)] {
    var queue = [(Int,Int)]()
    var idx = 0
    
    queue.append((sx,sy))
    visited[sx][sy] = true
    
    while idx < queue.count {
        let (x,y) = queue[idx]
        idx += 1
        
        for i in 0 ..< 4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if 0 <= nx, nx < n, 0 <= ny, ny < m,
               !visited[nx][ny] {
                if graph[nx][ny] > 0 {
                    visited[nx][ny] = true
                    queue.append((nx,ny))
                } else {
                    count[x][y] += 1
                }
            }
        }
    }
    
    return queue
}

var result = 0
while true {
    visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    count = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
    var union = [[(Int,Int)]]()
    
    for i in 0 ..< n {
        for j in 0 ..< m {
            if !visited[i][j], graph[i][j] > 0 {
                union.append(bfs(i,j))
            }
        }
    }
    
    // 종료 조건
    if union.count >= 2 {
        break
    }
    if union.isEmpty {
        result = 0
        break
    }
    
    // 빙하 녹이기
    for (x,y) in union[0] {
        graph[x][y] -= count[x][y]
        if graph[x][y] < 0 {
            graph[x][y] = 0
        }
    }
    
    result += 1
}

// 출력
print(result)
