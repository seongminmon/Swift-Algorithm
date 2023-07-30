//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/05/06.
//
// 최소직사각형
// 완전탐색
// LV.1
// https://school.programmers.co.kr/learn/courses/30/lessons/86491

import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    var Max = 0
    var Min = 0
    for i in 0..<sizes.count {
        Max = max(Max, max(sizes[i][0], sizes[i][1]))
        Min = max(Min, min(sizes[i][0], sizes[i][1]))
    }
    
    return Max * Min
}

print(solution([[60, 50], [30, 70], [60, 30], [80, 40]]))
print(solution([[10, 7], [12, 3], [8, 15], [14, 7], [5, 15]]))
print(solution([[14, 4], [19, 6], [6, 16], [18, 7], [7, 11]]))
