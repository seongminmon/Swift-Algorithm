//
//  mian.swift
//  Algorithm
//
//  Created by 김성민 on 2023/01/12.
//
// 14620 : 꽃길
// https://www.acmicpc.net/problem/14620

import Foundation

let n = Int(readLine()!)!
var graph = [[Int]]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph.append(input)
}

let dx = [0,0,0,1,-1]
let dy = [0,1,-1,0,0]

var ans = Int.max
var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
func dfs(_ depth: Int, _ start: Int, _ value: Int) {
    if depth == 3 {
        ans = min(ans, value)
        return
    }
    
    for i in start..<n {
        for j in 0..<n {
            var flag = true
            for d in 0..<5 {
                let ni = i + dx[d]
                let nj = j + dy[d]
                
                if ni < 0 || ni >= n || nj < 0 || nj >= n || visited[ni][nj] {
                    flag = false
                    break
                }
            }
            
            if !flag { continue }
            
            var value = value
            for d in 0..<5 {
                let ni = i + dx[d]
                let nj = j + dy[d]
                visited[ni][nj] = true
                value += graph[ni][nj]
            }
            
            dfs(depth+1, i, value)
            
            for d in 0..<5 {
                let ni = i + dx[d]
                let nj = j + dy[d]
                visited[ni][nj] = false
                value -= graph[ni][nj]
            }
        }
    }
}

dfs(0, 0, 0)

print(ans)
