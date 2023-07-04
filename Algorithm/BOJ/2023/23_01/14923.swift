//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/01/13.
//
// 14923 : 미로 탈출
// https://www.acmicpc.net/problem/14923

import Foundation

// 입력
let nm = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,m) = (nm[0], nm[1])
let start = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (sx,sy) = (start[0]-1, start[1]-1)
let end = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (ex,ey) = (end[0]-1, end[1]-1)

var graph = [[Int]]()
for _ in 0 ..< n {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    graph.append(input)
}

// 풀이
let dx = [0,0,1,-1]
let dy = [1,-1,0,0]

func bfs() -> Int {
    var visited = [[[Int]]](repeating: [[Int]](repeating: [-1,-1], count: m), count: n)
    visited[sx][sy][0] = 0
    
    var queue = [(sx,sy,0)]
    var idx = 0
    
    while idx < queue.count {
        let (x,y,cnt) = queue[idx]
        idx += 1
        
        if (x,y) == (ex,ey) {
            return visited[x][y][cnt]
        }
        
        for i in 0 ..< 4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            var nCnt = cnt
            
            if nx < 0 || nx >= n || ny < 0 || ny >= m {
                continue
            }
            
            if graph[nx][ny] == 1 {
                if nCnt == 1 {
                    continue
                } else {
                    nCnt = 1
                }
            }
            
            if visited[nx][ny][nCnt] == -1 {
                visited[nx][ny][nCnt] = visited[x][y][cnt] + 1
                queue.append((nx,ny,nCnt))
            }
        }
    }
    
    return -1
}

// 출력
print(bfs())
