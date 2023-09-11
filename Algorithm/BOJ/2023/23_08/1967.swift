//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/09/10.
//
// 1967 : 트리의 지름
// https://www.acmicpc.net/problem/1967

import Foundation

let n = Int(readLine()!)!
var graph = [[(Int,Int)]](repeating: [], count: n+1)
for _ in 0..<n-1 {
    let abc = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (a,b,c) = (abc[0], abc[1], abc[2])
    graph[a].append((b,c))
    graph[b].append((a,c))
}

// 1. 아무 노드에서 가장 거리가 먼 노드를 찾는다
// 2. 그 노드에서 가장 먼 거리가 정답

var startNode = 0
var ans = 0
var visited = [Bool](repeating: false, count: n+1)
func dfs(_ now: Int, _ dist: Int) {
    visited[now] = true
    
    if ans < dist {
        ans = dist
        startNode = now
    }
    
    for (next, nextDist) in graph[now] {
        if !visited[next] {
            dfs(next, dist + nextDist)
        }
    }
}

dfs(1, 0)
visited = [Bool](repeating: false, count: n+1)
dfs(startNode, 0)

print(ans)
