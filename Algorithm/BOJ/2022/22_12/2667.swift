//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/20.
//
// 2667 : 단지번호붙이기
// https://www.acmicpc.net/problem/2667

import Foundation

// 입력
let n = Int(readLine()!)!
var graph = [[Int]]()
for _ in 0 ..< n {
    let input = readLine()!.map{ Int(String($0))! }
    graph.append(input)
}

// 풀이
let dx = [0,0,1,-1]
let dy = [1,-1,0,0]

var visited = [[Bool]](repeating: [Bool](repeating: false ,count: n), count: n)
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
            
            if 0 <= nx, nx < n, 0 <= ny, ny < n,
               !visited[nx][ny], graph[nx][ny] == 1 {
                visited[nx][ny] = true
                queue.append((nx,ny))
            }
        }
    }
    
    return queue
}

var union = [[(Int,Int)]]()
for i in 0 ..< n {
    for j in 0 ..< n {
        if !visited[i][j], graph[i][j] == 1 {
            union.append(bfs(i, j))
        }
    }
}

var result = [Int]()
for i in union {
    result.append(i.count)
}
result.sort()

// 출력
print(result.count)
for i in result {
    print(i)
}
