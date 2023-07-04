//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/06.
//
// 2636 : 치즈
// https://www.acmicpc.net/problem/2636

import Foundation

// 입력
let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]
var graph = [[Int]]()
for _ in 0 ..< n {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    graph.append(input)
}

// 풀이
let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

func bfs() -> Int {
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    var queue = [(Int,Int)]()
    var idx = 0
    
    queue.append((0,0))
    visited[0][0] = true
    
    var cnt = 0
    while idx < queue.count {
        let (x,y) = queue[idx]
        idx += 1
        
        for i in 0 ..< 4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if 0 <= nx, nx < n, 0 <= ny, ny < m,
            !visited[nx][ny] {
                visited[nx][ny] = true
                if graph[nx][ny] == 0 {
                    queue.append((nx,ny))
                } else if graph[nx][ny] == 1 {
                    // 치즈 삭제
                    graph[nx][ny] = 0
                    cnt += 1
                }
            }
        }
    }
    
    return cnt
}

// 출력
var result = 0
var cnt = 0
while true {
    let ncnt = bfs()
    if ncnt == 0 {
        break
    }
    result += 1
    cnt = ncnt
}
print(result)
print(cnt)
