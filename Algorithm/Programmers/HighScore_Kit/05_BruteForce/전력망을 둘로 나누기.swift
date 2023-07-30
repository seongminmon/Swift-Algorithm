//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/05/09.
//
// 전력망을 둘로 나누기
// 완전탐색
// LV.2
// https://school.programmers.co.kr/learn/courses/30/lessons/86971

import Foundation

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    var result = Int.max
    for i in 0..<wires.count {
        var graph = [[Int]](repeating: [], count: n+1)
        for j in 0..<wires.count {
            if i == j { continue }
            graph[wires[j][0]].append(wires[j][1])
            graph[wires[j][1]].append(wires[j][0])
        }
        
        var visited = [Bool](repeating: false, count: n+1)
        var cnt = 0
        func dfs(_ now: Int) {
            visited[now] = true
            cnt += 1
            for next in graph[now] {
                if !visited[next] {
                    dfs(next)
                }
            }
        }
        dfs(1)
        result = min(result, abs(2*cnt - n))
    }
    
    return result
}

print(solution(
    9,
    [[1,3],[2,3],[3,4],[4,5],[4,6],[4,7],[7,8],[7,9]]
))
print(solution(
    4,
    [[1,2],[2,3],[3,4]]
))
print(solution(
    7,
    [[1,2],[2,7],[3,7],[3,4],[4,5],[6,7]]
))
