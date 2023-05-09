//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/03/18.
//
// 네트워크
// 깊이/너비 우선 탐색(DFS/BFS)
// Lv.3
// https://school.programmers.co.kr/learn/courses/30/lessons/43162

import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var computers = computers
    for i in 0 ..< n { computers[i][i] = 0 }
    
    var visited = [Bool](repeating: false, count: n)
    func bfs(_ start: Int) {
        visited[start] = true
        var queue = [start]
        var idx = 0
        
        while idx < queue.count {
            let now = queue[idx]
            idx += 1

            for i in 0 ..< n {
                if !visited[i], computers[now][i] == 1 {
                    queue.append(i)
                    visited[i] = true
                }
            }
        }
    }
    var result = 0
    for i in 0 ..< n {
        if !visited[i] {
            bfs(i)
            result += 1
        }
    }
    
    return result
}

print(solution(3, [[1, 1, 0], [1, 1, 0], [0, 0, 1]]))
print(solution(3, [[1, 1, 0], [1, 1, 1], [0, 1, 1]]))
