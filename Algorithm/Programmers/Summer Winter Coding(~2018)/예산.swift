//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/10/22.
//
// 예산
// Summer/Winter Coding(~2018)
// Lv.1
// https://school.programmers.co.kr/learn/courses/30/lessons/12982

import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {
    let d = d.sorted()
    var budget = budget
    var idx = 0
    while idx < d.count && budget > 0 {
        budget -= d[idx]
        idx += 1
    }
    if budget < 0 { idx -= 1 }
    return idx
}

print(solution([1,3,2,5,4], 9))
print(solution([2,2,3,3], 10))
