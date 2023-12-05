//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/10/13.
//
// 16234 : 인구 이동
// https://www.acmicpc.net/problem/16234

import Foundation

let nlr = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,l,r) = (nlr[0], nlr[1], nlr[2])

var graph = [[Int]]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph.append(input)
}

var unions = [[(Int,Int)]]()
var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
func bfs(_ sx: Int, _ sy: Int) -> [(Int,Int)] {
    let dx = [0,0,1,-1]
    let dy = [1,-1,0,0]
    
    visited[sx][sy] = true
    var queue = [(sx,sy)]
    var idx = 0
    while idx < queue.count {
        let (x,y) = queue[idx]
        idx += 1
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if 0 <= nx, nx < n, 0 <= ny, ny < n, !visited[nx][ny] {
                let diff = abs(graph[x][y] - graph[nx][ny])
                if l <= diff, diff <= r {
                    visited[nx][ny] = true
                    queue.append((nx,ny))
                }
            }
        }
    }
    
    return queue
}

func move(_ union: [(Int,Int)]) {
    var sum = 0
    for (x,y) in union {
        sum += graph[x][y]
    }
    
    let val = sum / union.count
    for (x,y) in union {
        graph[x][y] = val
    }
}

var ans = 0
while true {
    unions = [[(Int,Int)]]()
    visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    
    // 연합 찾기
    for i in 0..<n {
        for j in 0..<n {
            if !visited[i][j] {
                unions.append(bfs(i, j))
            }
        }
    }
    
    // 인구이동
    for union in unions {
        move(union)
    }
    
    if unions.count == n*n {
        break
    }
    
    ans += 1
}
print(ans)
