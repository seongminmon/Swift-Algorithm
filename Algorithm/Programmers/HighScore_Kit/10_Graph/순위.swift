//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/04/30.
//
// 순위
// 그래프
// LV.3
// https://school.programmers.co.kr/learn/courses/30/lessons/49191

import Foundation

func solution(_ n:Int, _ results:[[Int]]) -> Int {
    let INF = Int(1e9)
    var graph = [[Int]](repeating: [Int](repeating: INF, count: n), count: n)
    for i in 0..<n { graph[i][i] = 0 }
    
    for result in results {
        graph[result[0]-1][result[1]-1] = 1
    }
    
    for k in 0..<n {
        for i in 0..<n {
            for j in 0..<n {
                graph[i][j] = min(graph[i][j], graph[i][k] + graph[k][j])
            }
        }
    }
    
    var cnt = 0
    for i in 0..<n {
        var isRight = true
        for j in 0..<n {
            if graph[i][j] == INF && graph[j][i] == INF {
                isRight = false
                break
            }
        }
        if isRight { cnt += 1 }
    }
    
    return cnt
}

print(solution(5, [[4, 3], [4, 2], [3, 2], [1, 2], [2, 5]]))
