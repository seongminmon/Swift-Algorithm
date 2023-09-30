//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/09/30.
//
// 13023 : ABCDE
// https://www.acmicpc.net/problem/13023

import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,m) = (nm[0], nm[1])

var graph = [[Int]](repeating: [], count: n)
for _ in 0..<m {
    let ab = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (a,b) = (ab[0], ab[1])
    graph[a].append(b)
    graph[b].append(a)
}

var result = 0
var visited = [Bool](repeating: false, count: n)
func dfs(_ depth: Int, _ now: Int) {
    // 종료 조건
    if depth == 4 {
        result = 1
        return
    }
    
    visited[now] = true
    for next in graph[now] {
        if !visited[next] {
            dfs(depth+1, next)
        }
    }
    visited[now] = false
}

for i in 0..<n {
    if result == 1 { break }
    dfs(0, i)
}
print(result)
