//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/06/03.
//
// 1189 : 컴백홈
// https://www.acmicpc.net/problem/1189

import Foundation

let rck = readLine()!.split(separator: " ").map { Int(String($0))! }
let (r,c,k) = (rck[0], rck[1], rck[2])

var graph = [[String]]()
for _ in 0..<r {
    let input = readLine()!.map { String($0) }
    graph.append(input)
}

let dx = [0,0,1,-1]
let dy = [1,-1,0,0]

let start = (r-1, 0)
let end = (0, c-1)

var ans = 0
var visited = [[Bool]](repeating: [Bool](repeating: false, count: c), count: r)
visited[start.0][start.1] = true
func dfs(_ now: (Int,Int), _ dist: Int) {
    if now == end && dist == k {
        ans += 1
        return
    }
    
    for i in 0..<4 {
        let nx = now.0 + dx[i]
        let ny = now.1 + dy[i]
        
        if 0 <= nx, nx < r, 0 <= ny, ny < c,
           !visited[nx][ny], graph[nx][ny] != "T" {
            visited[nx][ny] = true
            dfs((nx,ny), dist+1)
            visited[nx][ny] = false
        }
    }
}

dfs(start, 1)

print(ans)
