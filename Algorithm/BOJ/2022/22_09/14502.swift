//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/09/29.
//
// 14502 : 연구소
// https://www.acmicpc.net/problem/14502

import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,m) = (nm[0], nm[1])

var graph = [[Int]]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph.append(input)
}

var emptyPlace = [(Int,Int)]()
var virus = [(Int,Int)]()
for i in 0..<n {
    for j in 0..<m {
        if graph[i][j] == 0 {
            emptyPlace.append((i,j))
        } else if graph[i][j] == 2 {
            virus.append((i,j))
        }
    }
}

let dx = [0,0,1,-1]
let dy = [1,-1,0,0]

var originalVisited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
for (x,y) in virus { originalVisited[x][y] = true }

func bfs() -> Int {
    var queue = virus
    var idx = 0
    while idx < queue.count {
        let (x,y) = queue[idx]
        idx += 1
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if 0 <= nx, nx < n, 0 <= ny, ny < m,
               !visited[nx][ny], graph[nx][ny] == 0 {
                visited[nx][ny] = true
                queue.append((nx,ny))
            }
        }
    }
    
    var cnt = 0
    for i in 0..<n {
        for j in 0..<m {
            if !visited[i][j] && graph[i][j] != 1 {
                cnt += 1
            }
        }
    }
    return cnt
}

var ans = 0
var visited = originalVisited

// 벽 세우기
for i in 0..<emptyPlace.count {
    for j in i+1..<emptyPlace.count {
        for k in j+1..<emptyPlace.count {
            let (x1,y1) = emptyPlace[i]
            let (x2,y2) = emptyPlace[j]
            let (x3,y3) = emptyPlace[k]
            
            graph[x1][y1] = 1
            graph[x2][y2] = 1
            graph[x3][y3] = 1
            
            // 바이러스 퍼뜨리기 + 안전구역 세기
            visited = originalVisited
            ans = max(ans, bfs())
            
            graph[x1][y1] = 0
            graph[x2][y2] = 0
            graph[x3][y3] = 0
        }
    }
}

print(ans)
