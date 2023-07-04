//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/20.
//
// 2178 : 미로 탐색
// https://www.acmicpc.net/problem/2178

import Foundation

// 입력
let nm = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,m) = (nm[0], nm[1])
var graph = [[Int]]()
for _ in 0 ..< n {
    let input = readLine()!.map{ Int(String($0))! }
    graph.append(input)
}

// 풀이
let dx = [0,0,1,-1]
let dy = [1,-1,0,0]

var visited = [[Int]](repeating: [Int](repeating: -1, count: m), count: n)
var queue = [(Int,Int)]()
var idx = 0

queue.append((0,0))
visited[0][0] = 1

while idx < queue.count {
    let (x,y) = queue[idx]
    idx += 1
    
    for i in 0 ..< 4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        
        // 범위 내, 미방문, 이동가능
        if 0 <= nx, nx < n, 0 <= ny, ny < m,
            visited[nx][ny] == -1, graph[nx][ny] == 1 {
            queue.append((nx,ny))
            visited[nx][ny] = visited[x][y] + 1
        }
    }
}

// 출력
print(visited[n-1][m-1])
