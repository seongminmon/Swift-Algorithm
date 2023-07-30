//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/04/30.
//
// 프로세스
// 스택/큐
// LV.2
// https://school.programmers.co.kr/learn/courses/30/lessons/42587

import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    let n = priorities.count
    let maxPrior = priorities.sorted(by: >)
    var cnt = 0
    while cnt < n {
        for i in 0..<n {
            if priorities[i] == maxPrior[cnt] {
                cnt += 1
                if i == location {
                    return cnt
                }
            }
        }
    }
    
    return -1
}

print(solution([2, 1, 3, 2], 2))
print(solution([1, 1, 9, 1, 1, 1], 0))
