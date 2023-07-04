//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/01/11.
//
// 2638 : 치즈
// https://www.acmicpc.net/problem/2638

import Foundation

let nm = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,m) = (nm[0], nm[1])
var graph = [[Int]]()
for _ in 0 ..< n {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    graph.append(input)
}

let dx = [0,0,1,-1]
let dy = [1,-1,0,0]
func bfs() -> Int {
    var visited = [[Int]](repeating: [Int](repeating: -1, count: m), count: n)
    visited[0][0] = 0
    
    var queue = [(0,0)]
    var idx = 0
    
    while idx < queue.count {
        let (x,y) = queue[idx]
        idx += 1
        
        for i in 0 ..< 4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if 0 <= nx, nx < n, 0 <= ny, ny < m {
                // 빈칸일때
                if graph[nx][ny] == 0 {
                    if visited[nx][ny] == -1 {
                        visited[nx][ny] = 0
                        queue.append((nx,ny))
                    }
                // 치즈일때
                } else {
                    visited[nx][ny] += 1
                }
            }
        }
    }
    
    // 치즈 지우기
    for i in 0 ..< n {
        for j in 0 ..< m {
            if visited[i][j] >= 1 {
                graph[i][j] = 0
            }
        }
    }
    
    return queue.count
}

var result = 0
while true {
    if bfs() == n*m {
        break
    }
    result += 1
}
print(result)
