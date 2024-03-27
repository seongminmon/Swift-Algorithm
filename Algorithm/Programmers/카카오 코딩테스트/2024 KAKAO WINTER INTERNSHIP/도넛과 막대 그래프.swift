//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 3/23/24.
//
// 도넛과 막대 그래프
// 2024 KAKAO WINTER INTERNSHIP
// Lv.2
// https://school.programmers.co.kr/learn/courses/30/lessons/258711

import Foundation

func solution(_ edges:[[Int]]) -> [Int] {
    var result = [0,0,0,0]
    
    var SIZE = 0
    var indegree = [Int](repeating: 0, count: 1_000_001)
    var outdegree = [Int](repeating: 0, count: 1_000_001)
    
    for edge in edges {
        SIZE = max(SIZE, edge[0], edge[1])
        outdegree[edge[0]] += 1
        indegree[edge[1]] += 1
    }
    
    var totalCnt = 0
    for i in 1...SIZE {
        if indegree[i] == 0 && outdegree[i] >= 2 {
            // 생성한 정점
            result[0] = i
            totalCnt = outdegree[i]
        } else if indegree[i] > 0 && outdegree[i] == 0 {
            // 막대
            result[2] += 1
        } else if indegree[i] >= 2 && outdegree[i] >= 2 {
            // 8자
            result[3] += 1
        }
    }
    
    // 도넛
    result[1] = totalCnt - result[2] - result[3]
    
    return result
}

print(solution([[2,3], [4,3], [1,1], [2,1]]))
print(solution([[4, 11], [1, 12], [8, 3], [12, 7], [4, 2], [7, 11], [4, 8], [9, 6], [10, 11], [6, 10], [3, 5], [11, 1], [5, 3], [11, 9], [3, 8]]))
