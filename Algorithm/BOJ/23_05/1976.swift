//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/05/30.
//
// 1976 : 여행 가자
// https://www.acmicpc.net/problem/1976

import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!
var graph = [[Int]]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph.append(input)
}
var route = readLine()!.split(separator: " ").map { Int(String($0))! - 1 }

var visited = [Bool](repeating: false, count: n)
func dfs(_ node: Int) {
    visited[node] = true

    for i in 0..<n {
        if graph[node][i] == 1 && !visited[i] {
            dfs(i)
        }
    }
}

dfs(route[0])

var isPossible = true
for i in 0..<m {
    if !visited[route[i]] {
        isPossible = false
        break
    }
}
print(isPossible ? "YES" : "NO")
