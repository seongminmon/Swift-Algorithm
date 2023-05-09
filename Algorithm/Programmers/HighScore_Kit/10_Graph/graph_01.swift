//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/04/30.
//
// 가장 먼 노드
// 그래프
// LV.3
// https://school.programmers.co.kr/learn/courses/30/lessons/49189

import Foundation

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    var graph = [[Int]](repeating: [], count: n+1)
    for i in 0..<edge.count {
        let (a,b) = (edge[i][0], edge[i][1])
        graph[a].append(b)
        graph[b].append(a)
    }
    
    var visited = [Int](repeating: -1, count: n+1)
    visited[1] = 0
    var queue = [1]
    var idx = 0
    
    while idx < queue.count {
        let now = queue[idx]
        idx += 1
        
        for next in graph[now] {
            if visited[next] == -1 {
                visited[next] = visited[now] + 1
                queue.append(next)
            }
        }
    }
    
    var result = 0
    let maxDist = visited.max()!
    for i in 1...n {
        if visited[i] == maxDist {
            result += 1
        }
    }
    
    return result
}

print(solution(6, [[3, 6], [4, 3], [3, 2], [1, 3], [1, 2], [2, 4], [5, 2]]))
