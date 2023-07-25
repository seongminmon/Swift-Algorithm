//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/07/02.
//
// 동굴 탐험
// 2020 카카오 인턴십
// Lv. 4
// https://school.programmers.co.kr/learn/courses/30/lessons/67260

import Foundation

func solution(_ n:Int, _ path:[[Int]], _ order:[[Int]]) -> Bool {
    var graph = [[Int]](repeating: [], count: n)
    for ab in path {
        graph[ab[0]].append(ab[1])
        graph[ab[1]].append(ab[0])
    }

    var locked = [Int](repeating: -1, count: n)
    for ab in order { locked[ab[1]] = ab[0] }
    
    if locked[0] != -1 { return false }

    var after = [Int](repeating: -1, count: n)
    var visited = [Bool](repeating: false, count: n)
    var stack = [0]
    while !stack.isEmpty {
        let now = stack.removeLast()
        
        if locked[now] != -1 && !visited[locked[now]] {
            after[locked[now]] = now
            continue
        }

        visited[now] = true
        for next in graph[now] {
            if !visited[next] {
                stack.append(next)
            }
        }

        if after[now] != -1 {
            stack.append(after[now])
        }
    }
    
    return visited.filter{ !$0 }.isEmpty
}

print(solution(
    9,
    [[0,1],[0,3],[0,7],[8,1],[3,6],[1,2],[4,7],[7,5]],
    [[8,5],[6,7],[4,1]]
))
print(solution(
    9,
    [[8,1],[0,1],[1,2],[0,7],[4,7],[0,3],[7,5],[3,6]],
    [[4,1],[5,2]]
))
print(solution(
    9,
    [[0,1],[0,3],[0,7],[8,1],[3,6],[1,2],[4,7],[7,5]],
    [[4,1],[8,7],[6,5]]
))
