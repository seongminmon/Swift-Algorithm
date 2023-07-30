//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/05/09.
//
// 카펫
// 완전탐색
// LV.2
// https://school.programmers.co.kr/learn/courses/30/lessons/42842

import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    let total = brown + yellow
    var w = -1
    var h = -1
    for i in 1...total {
        if total % i == 0 {
            w = total / i
            h = i
            if (w-2) * (h-2) == yellow {
                return [w,h]
            }
        }
    }
    return []
}

print(solution(10, 2))
print(solution(8, 1))
print(solution(24, 24))
