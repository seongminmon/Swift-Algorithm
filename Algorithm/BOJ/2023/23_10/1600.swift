//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/10/11.
//
// 1600 : 말이 되고픈 원숭이
// https://www.acmicpc.net/problem/1600

import Foundation

let k = Int(readLine()!)!
let mn = readLine()!.split(separator: " ").map { Int(String($0))! }
let (m,n) = (mn[0], mn[1])

var graph = [[Int]]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph.append(input)
}

let hx = [-2, -2, -1, -1, 1, 1, 2, 2]
let hy = [-1, 1, -2, 2, -2, 2, -1, 1]

let dx = [0,0,1,-1]
let dy = [1,-1,0,0]

var visited = [[[Bool]]](repeating: [[Bool]](repeating: [Bool](repeating: false, count: k+1), count: m), count: n)
visited[0][0][0] = true

//(x, y, 나이트이동횟수, 거리)
var queue = [(Int,Int,Int,Int)]()
queue.append((0,0,0,0))
var idx = 0

var ans = Int.max
while idx < queue.count {
    let (x, y, cnt, dist) = queue[idx]
    idx += 1
    
    // 갱신
    if (x, y) == (n-1, m-1) {
        ans = min(ans, dist)
    }
    
    // 나이트 이동
    if cnt < k {
        for i in 0..<8 {
            let nx = x + hx[i]
            let ny = y + hy[i]
            
            if 0 <= nx, nx < n, 0 <= ny, ny < m,
                !visited[nx][ny][cnt+1], graph[nx][ny] == 0 {
                visited[nx][ny][cnt+1] = true
                queue.append((nx, ny, cnt+1, dist+1))
            }
        }
    }
    
    // 일반 이동
    for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        
        if 0 <= nx, nx < n, 0 <= ny, ny < m,
            !visited[nx][ny][cnt], graph[nx][ny] == 0 {
            visited[nx][ny][cnt] = true
            queue.append((nx, ny, cnt, dist+1))
        }
    }
}

print(ans == Int.max ? -1 : ans)
