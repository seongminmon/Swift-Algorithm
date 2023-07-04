//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/01/27.
//
// 3184 : 양
// https://www.acmicpc.net/problem/3184

import Foundation

let rc = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (r,c) = (rc[0], rc[1])

var graph = [[String]]()
for _ in 0 ..< r {
    let input = readLine()!.map{ String($0) }
    graph.append(input)
}

// . : 빈칸, # : 울타리, o : 양, v : 늑대
var totalSheepCnt = 0
var totalWolfCnt = 0
for i in 0 ..< r {
    for j in 0 ..< c {
        if graph[i][j] == "o" {
            totalSheepCnt += 1
        }
        if graph[i][j] == "v" {
            totalWolfCnt += 1
        }
    }
}

let dx = [0,0,1,-1]
let dy = [1,-1,0,0]

var visited = [[Bool]](repeating: [Bool](repeating: false, count: c), count: r)
func bfs(_ sx: Int, _ sy: Int) {
    visited[sx][sy] = true
    var queue = [(sx,sy)]
    var idx = 0
    
    while idx < queue.count {
        let (x,y) = queue[idx]
        idx += 1
        
        for i in 0 ..< 4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if 0 <= nx, nx < r, 0 <= ny, ny < c,
               !visited[nx][ny], graph[nx][ny] != "#" {
                queue.append((nx,ny))
                visited[nx][ny] = true
            }
        }
    }
    
    var nowSheepCnt = 0
    var nowWolfCnt = 0
    for (x,y) in queue {
        if graph[x][y] == "o" {
            nowSheepCnt += 1
        }
        if graph[x][y] == "v" {
            nowWolfCnt += 1
        }
    }
    
    if nowSheepCnt > nowWolfCnt {
        totalWolfCnt -= nowWolfCnt
    } else {
        totalSheepCnt -= nowSheepCnt
    }
}

for i in 0 ..< r {
    for j in 0 ..< c {
        if !visited[i][j], graph[i][j] != "#" {
            bfs(i, j)
        }
    }
}

print(totalSheepCnt, totalWolfCnt)
