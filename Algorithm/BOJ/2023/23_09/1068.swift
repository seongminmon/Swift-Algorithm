//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/09/17.
//
// 1068 : 트리
// https://www.acmicpc.net/problem/1068

import Foundation

let n = Int(readLine()!)!
var parent = readLine()!.split(separator: " ").map { Int(String($0))! }
let target = Int(readLine()!)!

var graph = [[Int]](repeating: [], count: n)
var root = -1
for i in 0..<n {
    if parent[i] != -1 {
        graph[parent[i]].append(i)
    } else {
        root = i
    }
}

var leafCnt = 0
func solve(_ node: Int) {
    if node == target {
        return
    }
    
    // 종료 조건
    if graph[node].isEmpty {
        leafCnt += 1
        return
    }
    
    if graph[node] == [target] {
        leafCnt += 1
        return
    }
    
    for next in graph[node] {
        solve(next)
    }
}

solve(root)

print(leafCnt)
