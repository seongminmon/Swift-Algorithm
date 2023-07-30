//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/04/30.
//
// 기능개발
// 스택/큐
// LV.2
// https://school.programmers.co.kr/learn/courses/30/lessons/42586

import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    let n = progresses.count
    var days = [Int](repeating: 0, count: n)
    for i in 0..<n {
        days[i] = (100 - progresses[i]) / speeds[i]
        if (100 - progresses[i]) % speeds[i] != 0 {
            days[i] += 1
        }
    }
    
    var result = [Int]()
    var today = days[0]
    var cnt = 0
    var idx = 0
    while idx < n {
        if today >= days[idx] {
            cnt += 1
            idx += 1
        } else {
            today = days[idx]
            result.append(cnt)
            cnt = 0
        }
    }
    result.append(cnt)
    
    return result
}

print(solution(
    [93, 30, 55],
    [1, 30, 5]
))

print(solution(
    [95, 90, 99, 99, 80, 99],
    [1, 1, 1, 1, 1, 1]
))
