//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/01/21.
//
// 2210 : 숫자판 점프
// https://www.acmicpc.net/problem/2210

import Foundation

let n = 5
var graph = [[String]]()
for _ in 0 ..< n {
    let input = readLine()!.split(separator: " ").map{ String($0) }
    graph.append(input)
}

let dx = [0,0,1,-1]
let dy = [1,-1,0,0]

var result = Set<String>()
func dfs(_ depth: Int, _ x: Int, _ y: Int, _ str: String) {
    if depth == 5 {
        result.insert(str)
        return
    }
    
    for i in 0 ..< 4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        
        if 0 <= nx, nx < n, 0 <= ny, ny < n {
            dfs(depth+1, nx, ny, str + graph[nx][ny])
        }
    }
}

for i in 0 ..< n {
    for j in 0 ..< n {
        dfs(0, i, j, graph[i][j])
    }
}
print(result.count)
