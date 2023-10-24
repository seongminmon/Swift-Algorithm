//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/10/24.
//
// 피보나치 수
// 코딩테스트 연습 힌트 모음집
// Lv.2
// https://school.programmers.co.kr/learn/courses/30/lessons/12945?itm_content=course14743

import Foundation

func solution(_ n:Int) -> Int {
    let mod = 1234567
    var dp = [Int](repeating: 0, count: n+1)
    dp[1] = 1
    for i in 2...n {
        dp[i] = (dp[i-1] + dp[i-2]) % mod
    }
    return dp[n]
}

print(solution(3))
print(solution(5))
