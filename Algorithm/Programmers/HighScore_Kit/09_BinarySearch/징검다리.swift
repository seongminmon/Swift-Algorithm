//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/04/24.
//
// 징검다리
// 이분탐색
// Lv.4
// https://school.programmers.co.kr/learn/courses/30/lessons/43236

import Foundation

import Foundation

func solution(_ distance:Int, _ rocks:[Int], _ n:Int) -> Int {
    let rocks = rocks.sorted() + [distance]
    
    var result = 1
    var start = 1
    var end = distance
    while start <= end {
        let mid = (start + end) / 2
        
        var cnt = 0
        var current = 0
        for rock in rocks {
            if rock - current < mid {
                cnt += 1
                if cnt > n { break }
            } else {
                current = rock
            }
        }
        
        if cnt <= n {
            result = mid
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    
    return result
}

print(solution(
    25,
    [2, 14, 11, 21, 17],
    2
))
