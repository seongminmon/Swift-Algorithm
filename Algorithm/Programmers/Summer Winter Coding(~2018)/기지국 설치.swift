//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/10/21.
//
// 기지국 설치
// Summer/Winter Coding(~2018)
// Lv.3
// https://school.programmers.co.kr/learn/courses/30/lessons/12979

import Foundation

func solution(_ n:Int, _ stations:[Int], _ w:Int) -> Int {
    let range = w * 2 + 1
    func solve(_ start: Int, _ end: Int) -> Int {
        let num = end - start + 1
        
        if num <= 0 { return 0 }
        
        if num % range == 0 {
            return num / range
        } else {
            return num / range + 1
        }
    }
    
    var ans = 0
    var start = 1
    var end = stations[0] - w - 1
    ans += solve(start, end)
    
    for i in 1..<stations.count {
        start = stations[i-1] + w + 1
        end = stations[i] - w - 1
        ans += solve(start, end)
    }
    
    start = stations.last! + w + 1
    end = n
    ans += solve(start, end)
    
    return ans
}

print(solution(11, [4, 11], 1))
print(solution(16, [9], 2))
