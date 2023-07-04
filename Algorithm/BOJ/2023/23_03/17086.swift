//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/03/12.
//
// 17086 : 아기 상어 2
// https://www.acmicpc.net/problem/17086

import Foundation

let nm = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,m) = (nm[0], nm[1])

var graph = [[Int]]()
for _ in 0 ..< n {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    graph.append(input)
}

var sharks = [(Int,Int)]()
for i in 0 ..< n {
    for j in 0 ..< m {
        if graph[i][j] == 1 {
            sharks.append((i,j))
        }
    }
}

let dx = [0,0,1,1,1,-1,-1,-1]
let dy = [1,-1,0,1,-1,0,1,-1]

func bfs(_ sharks: [(Int,Int)]) -> [[Int]] {
    var visited = [[Int]](repeating: [Int](repeating: Int.max, count: m), count: n)
    var queue = sharks
    var idx = 0
    
    for (x,y) in queue {
        visited[x][y] = 0
    }
    
    while idx < queue.count {
        let (x,y) = queue[idx]
        idx += 1
        
        for i in 0 ..< 8 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if 0 <= nx, nx < n, 0 <= ny, ny < m,
               visited[nx][ny] > visited[x][y] + 1 {
                visited[nx][ny] = visited[x][y] + 1
                queue.append((nx,ny))
            }
        }
    }
    
    return visited
}

let visited = bfs(sharks)
var result = 0
for i in 0 ..< n {
    for j in 0 ..< m {
        if graph[i][j] == 0 {
            result = max(result, visited[i][j])
        }
    }
}
print(result)
