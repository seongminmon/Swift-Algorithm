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
        var SIZE = 0
    for edge in edges {
        let (a,b) = (edge[0], edge[1])
        SIZE = max(SIZE, a, b)
    }
    
    var graph = [[Int]](repeating: [], count: SIZE+1)
    for edge in edges {
        let (a,b) = (edge[0], edge[1])
        graph[a].append(b)
    }
    print(graph)
    return []
}

print(solution([[2,3], [4,3], [1,1], [2,1]]))
print(solution([[4, 11], [1, 12], [8, 3], [12, 7], [4, 2], [7, 11], [4, 8], [9, 6], [10, 11], [6, 10], [3, 5], [11, 1], [5, 3], [11, 9], [3, 8]]))
