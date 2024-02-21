//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2/19/24.
//
// 12100 : 2048 (Easy)
// https://www.acmicpc.net/problem/12100

import Foundation

let n = Int(readLine()!)!
var graph = [[Int]]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph.append(input)
}

// 시계방향으로 90도 회전하는 함수
func rotate(_ graph: [[Int]]) -> [[Int]] {
    var newGraph = graph
    for i in 0..<n {
        for j in 0..<n {
            newGraph[j][n-1-i] = graph[i][j]
        }
    }
    return newGraph
}

// 왼쪽으로 이동하는 함수
func move(_ graph: [[Int]]) -> [[Int]] {
    var newGraph = graph
    for i in 0..<n {
        // 1. 0 다 없애기
        var row = newGraph[i].filter { $0 != 0 }
        
        if row.isEmpty { continue }
        
        // 2. 합치기
        for j in 0..<row.count-1 {
            if row[j] == row[j+1] {
                row[j] *= 2
                row[j+1] = 0
            }
        }
        
        // 3. 빈자리 채우기
        row = row.filter { $0 != 0 }
        while row.count < n { row.append(0) }
        
        // 결과 넣기
        newGraph[i] = row
    }
    
    return newGraph
}

var ans = 0
func dfs(_ depth: Int, _ graph: [[Int]]) {
    // 종료 조건
    if depth == 5 {
        for i in 0..<n {
            for j in 0..<n {
                ans = max(ans, graph[i][j])
            }
        }
        return
    }
    
    for i in 0..<4 {
        var nextGraph = graph
        // 회전
        for _ in 0..<i { nextGraph = rotate(nextGraph) }
        // 이동
        nextGraph = move(nextGraph)
        // 원상복구
        for _ in i..<4 { nextGraph = rotate(nextGraph) }
        // 탐색
        dfs(depth+1, nextGraph)
    }
}

dfs(0, graph)

print(ans)
