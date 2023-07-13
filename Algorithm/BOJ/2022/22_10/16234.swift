//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/10/13.
//
// 16234 : 인구 이동
// https://www.acmicpc.net/problem/16234

import Foundation

// 입력
let nlr = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,l,r) = (nlr[0], nlr[1], nlr[2])
var graph = [[Int]](repeating: [], count: n)
for i in 0 ..< n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph[i] = input
}

// 풀이
var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
var union = [[(Int,Int)]]()

func bfs(x: Int, y: Int) {
    let dx = [0,0,1,-1]
    let dy = [1,-1,0,0]
    var queue = [(Int,Int)]()
    var idx = 0
    
    queue.append((x,y))
    visited[x][y] = true
    
    while idx < queue.count {
        let (curx, cury) = queue[idx]
        idx += 1
        
        for i in 0 ..< 4 {
            let nx = curx + dx[i]
            let ny = cury + dy[i]
            
            if 0 <= nx, nx < n, 0 <= ny, ny < n, !visited[nx][ny] {
                let diff = abs(graph[curx][cury] - graph[nx][ny])
                if l <= diff, diff <= r {
                    visited[nx][ny] = true
                    queue.append((nx,ny))
                }
            }
        }
    }
    
    union.append(queue)
}

var result = 0
while true {
    visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    union = [[(Int,Int)]]()
    
    // 1. 연합 생성
    for i in 0 ..< n {
        for j in 0 ..< n {
            if !visited[i][j] {
                bfs(x: i, y: j)
            }
        }
    }
    
    // 종료 조건
    if union.count == n*n {
        break
    }
    
    // 2. 인구 이동
    for i in 0 ..< union.count {
        if union[i].count == 1 {
            continue
        }
        
        var sum = 0
        for (x,y) in union[i] {
            sum += graph[x][y]
        }
        for (x,y) in union[i] {
            graph[x][y] = sum / union[i].count
        }
    }
    
    result += 1
}

// 출력
print(result)
