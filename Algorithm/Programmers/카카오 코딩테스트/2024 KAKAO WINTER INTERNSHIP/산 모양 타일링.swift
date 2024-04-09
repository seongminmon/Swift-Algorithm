//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 3/23/24.
//
// 산 모양 타일링
// 2024 KAKAO WINTER INTERNSHIP
// Lv.3
// https://school.programmers.co.kr/learn/courses/30/lessons/258705

import Foundation

func solution(_ n:Int, _ tops:[Int]) -> Int {
    let mod = 10007
    
    var dp1 = [Int](repeating: 0, count: n+1)
    var dp2 = [Int](repeating: 0, count: n+1)
    dp2[0] = 1

    for i in 1...n {
        if tops[i-1] == 1 {
            dp1[i] = (dp1[i-1] + dp2[i-1]) % mod
            dp2[i] = (2 * dp1[i-1] + 3 * dp2[i-1]) % mod
        } else {
            dp1[i] = (dp1[i-1] + dp2[i-1]) % mod
            dp2[i] = (dp1[i-1] + 2 * dp2[i-1]) % mod
        }
    }
    
    return (dp1[n] + dp2[n]) % mod
}

print(solution(4, [1, 1, 0, 1]))
print(solution(2, [0, 1]))
print(solution(10, [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]))
