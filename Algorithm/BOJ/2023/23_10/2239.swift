//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/10/30.
//
// 2239 : 스도쿠
// https://www.acmicpc.net/problem/2239

import Foundation

let n = 9
var graph = [[Int]]()
for _ in 0..<n {
    let input = readLine()!.map { Int(String($0))! }
    graph.append(input)
}

func isValid(_ x: Int, _ y: Int, _ num: Int) -> Bool {
    for i in 0..<n {
        if graph[x][i] == num {
            return false
        }
        if graph[i][y] == num {
            return false
        }
    }
    
    let idx = (x / 3) * 3
    let jdx = (y / 3) * 3
    for i in idx..<(idx+3) {
        for j in jdx..<(jdx+3) {
            if graph[i][j] == num {
                return false
            }
        }
    }
    
    return true
}

func dfs(_ idx: Int) {
    // 종료 조건
    if idx == n*n {
        for i in 0..<n {
            print(graph[i].map { String($0) }.joined())
        }
        exit(0)
    }
    
    let x = idx / 9
    let y = idx % 9
    
    if graph[x][y] == 0 {
        for num in 1...9 {
            if isValid(x, y, num) {
                graph[x][y] = num
                dfs(idx+1)
                graph[x][y] = 0
            }
        }
    } else {
        dfs(idx+1)
    }
}

dfs(0)
