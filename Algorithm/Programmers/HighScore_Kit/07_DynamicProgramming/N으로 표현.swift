//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/04/24.
//
// N으로 표현
// 동적계획법(Dynamic Programming)
// LV.3
// https://school.programmers.co.kr/learn/courses/30/lessons/42895

import Foundation

func solution(_ N:Int, _ number:Int) -> Int {
    var result = 9
    func dfs(_ cnt: Int, _ now: Int) {
        if cnt >= result { return }
        
        if now == number {
            result = min(result, cnt)
            return
        }
        
        var next = N
        for i in 0 ..< 8 {
            var nCnt = cnt + 1 + i
            dfs(nCnt, now + next)
            dfs(nCnt, now - next)
            dfs(nCnt, now * next)
            dfs(nCnt, now / next)
            next = next * 10 + N
        }
    }
    
    dfs(0, 0)
    
    return result == 9 ? -1 : result
}

print(solution(5, 12))
print(solution(2, 11))
print(solution(6, 6))
