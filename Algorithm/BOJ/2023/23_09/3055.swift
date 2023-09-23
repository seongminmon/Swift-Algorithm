//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/09/11.
//
// 3055 : 탈출
// https://www.acmicpc.net/problem/3055

import Foundation

let rc = readLine()!.split(separator: " ").map { Int(String($0))! }
let (r,c) = (rc[0], rc[1])
var graph = [[String]]()
for _ in 0..<r {
    let input = readLine()!.map { String($0) }
    graph.append(input)
}

var start = (0,0)
var end = (0,0)
var water = [(Int,Int)]()
for i in 0..<r {
    for j in 0..<c {
        if graph[i][j] == "S" {
            graph[i][j] = "."
            start = (i,j)
        } else if graph[i][j] == "D" {
            end = (i,j)
        } else if graph[i][j] == "*" {
            water.append((i,j))
        }
    }
}

let dx = [0,0,1,-1]
let dy = [1,-1,0,0]

var visited = [[Bool]](repeating: [Bool](repeating: false, count: c), count: r)
visited[start.0][start.1] = true
var queue = [(start.0, start.1, 0)]
var idx = 0

var ans = -1
while idx < queue.count {
    let (x, y, dist) = queue[idx]
    idx += 1
    
    // 종료 조건
    if (x,y) == end {
        ans = dist
        break
    }
    
    // 1. 물 이동
    if idx == 1 || queue[idx-2].2 != dist {
        var nextWater = [(Int,Int)]()
        
        for (x,y) in water {
            for i in 0..<4 {
                let nx = x + dx[i]
                let ny = y + dy[i]
                
                if 0 <= nx, nx < r, 0 <= ny, ny < c, graph[nx][ny] == "." {
                    nextWater.append((nx, ny))
                    graph[nx][ny] = "*"
                }
            }
        }
        
        water = nextWater
    }
    
    // 2. 고슴도치 이동
    for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        
        if 0 <= nx, nx < r, 0 <= ny, ny < c, !visited[nx][ny] {
            if graph[nx][ny] == "." || graph[nx][ny] == "D" {
                visited[nx][ny] = true
                queue.append((nx, ny, dist+1))
            }
        }
    }
}

print(ans == -1 ? "KAKTUS" : ans)
