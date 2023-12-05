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
let parent = readLine()!.split(separator: " ").map { Int(String($0))! }
let target = Int(readLine()!)!

var root = -1
var graph = [[Int]](repeating: [], count: n)
for i in 0..<n {
    if parent[i] == -1 {
        root = i
    } else {
        graph[parent[i]].append(i)
    }
}

// 리프노드의 개수 리턴
func dfs(_ now: Int) -> Int {
    // 지울 노드일 때
    if now == target { return 0 }
    
    // 자식 노드가 없을 때
    if graph[now].isEmpty { return 1 }
    
    // 노드의 자식이 target뿐이라면 리프노드가 됨
    if graph[now] == [target] { return 1 }
    
    var ret = 0
    for next in graph[now] {
        ret += dfs(next)
    }
    return ret
}

print(dfs(root))
