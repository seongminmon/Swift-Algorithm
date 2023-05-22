//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/05/21.
//
// 3109 : 빵집
// https://www.acmicpc.net/problem/3109

import Foundation

let rc = readLine()!.split(separator: " ").map { Int(String($0))! }
let (r,c) = (rc[0], rc[1])

var graph = [[String]]()
for _ in 0..<r {
    let input = readLine()!.map { String($0) }
    graph.append(input)
}

let dx = [-1,0,1]
func dfs(_ x: Int, _ y: Int) -> Bool {
    if y == c-1 {
        return true
    }
    
    for i in 0..<3 {
        let nx = x + dx[i]
        let ny = y + 1
        
        if 0 <= nx, nx < r, 0 <= ny, ny < c, graph[nx][ny] != "x" {
            graph[nx][ny] = "x"
            if dfs(nx, ny) {
                return true
            }
        }
    }
    return false
}

var ans = 0
for i in 0..<r {
    if dfs(i, 0) {
        ans += 1
    }
}
print(ans)
