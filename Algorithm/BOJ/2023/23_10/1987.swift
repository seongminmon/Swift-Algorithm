//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/10/24.
//
// 1987 : 알파벳
// https://www.acmicpc.net/problem/1987

import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,m) = (nm[0], nm[1])

var graph = [[Int]]()
for _ in 0..<n {
    let input = readLine()!.map { Int($0.asciiValue!) - 65 }
    graph.append(input)
}

let dx = [0,0,1,-1]
let dy = [1,-1,0,0]

var ans = 1
func dfs(_ x: Int, _ y: Int, _ dist: Int, _ bitmask: Int) {
    if ans < dist { ans = dist }
    
    for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        
        if 0 <= nx, nx < n, 0 <= ny, ny < m {
            let bit = 1 << graph[nx][ny]
            // 미방문 일때 (사용한 알파벳이 안 겹칠 때)
            if bitmask & bit == 0 {
                dfs(nx, ny, dist+1, bitmask | bit)
            }
        }
    }
}

dfs(0, 0, 1, 1 << graph[0][0])

print(ans)
