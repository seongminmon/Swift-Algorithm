//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/01/13.
//
// 11724 : 연결 요소의 개수
// https://www.acmicpc.net/problem/11724

import Foundation

let nm = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,m) = (nm[0], nm[1])
var graph = [[Int]](repeating: [], count: n)
for _ in 0 ..< m {
    let uv = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let (u,v) = (uv[0]-1, uv[1]-1)
    graph[u].append(v)
    graph[v].append(u)
}

var visited = [Bool](repeating: false, count: n)
// 1. dfs
func dfs(_ x: Int) {
    visited[x] = true
    for i in graph[x] {
        if !visited[i] {
            dfs(i)
        }
    }
}

// 2. bfs
func bfs(_ start: Int) {
    visited[start] = true
    var queue = [start]
    var idx = 0

    while idx < queue.count {
        let x = queue[idx]
        idx += 1

        for nx in graph[x] {
            if !visited[nx] {
                visited[nx] = true
                queue.append(nx)
            }
        }
    }
}

var result = 0
for i in 0 ..< n {
    if !visited[i] {
//        bfs(i)
        dfs(i)
        result += 1
    }
}
print(result)
