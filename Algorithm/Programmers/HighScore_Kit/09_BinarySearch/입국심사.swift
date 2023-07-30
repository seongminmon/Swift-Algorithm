//
//  immigration.swift
//  Algorithm
//
//  Created by 김성민 on 2022/10/22.
//
// 입국심사
// 이분탐색
// Lv.3
// https://school.programmers.co.kr/learn/courses/30/lessons/43238

import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    var start: Int64 = 1
    var end: Int64 = Int64(times.max()!) * Int64(n)
    
    var result: Int64 = 0
    while start <= end {
        let mid = (start + end) / 2
        
        var people: Int64 = 0
        for i in times {
            people += mid / Int64(i)
        }
        
        if people < n {
            start = mid + 1
        } else {
            end = mid - 1
            result = mid
        }
    }
    
    return result
}

let n = 6
let times = [7,10]
print(solution(n, times))
