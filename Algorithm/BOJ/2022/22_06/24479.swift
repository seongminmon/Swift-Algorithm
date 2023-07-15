//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/06/08.
//
// 24479 : 알고리즘 수업 - 깊이 우선 탐색 1
// https://www.acmicpc.net/problem/24479

import Foundation

let input1 = readLine()!.split(separator: " ").map{ Int(String($0))! }
var n = input1[0]
var m = input1[1]
var start = input1[2]
var graph = [[Int]](repeating: [], count: n+1)
var visited = [Bool](repeating: false, count: n+1)

for _ in 1...m {
    let t = readLine()!.split(separator: " ").map{ Int(String($0))! }
    graph[t[0]].append(t[1])
    graph[t[1]].append(t[0])
}

// 오름차순 접근 위해서 정렬
for i in 1...n {
    graph[i].sort()
}

// 방문 순서를 담은 배열 (방문 하지 않은 곳은 0이다)
var ans = [Int](repeating: 0, count: n+1)
var order = 1

func DFS(graph: inout [[Int]], node: Int, visited: inout [Bool]) {
    visited[node] = true
    ans[node] = order
    order += 1
    for dot in graph[node] {
        if !visited[dot] {
            DFS(graph: &graph, node: dot, visited: &visited)
        }
    }
}

// DFS 탐색
DFS(graph: &graph, node: start, visited: &visited)

for i in 1...n {
    print(ans[i])
}
