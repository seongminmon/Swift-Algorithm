//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/08/17.
//
// 코딩 테스트 공부
// 2022 KAKAO TECH INTERNSHIP
// Lv.3
// https://school.programmers.co.kr/learn/courses/30/lessons/118668

import Foundation

func solution(_ alp:Int, _ cop:Int, _ problems:[[Int]]) -> Int {
    let maxAlp = problems.map { $0[0] }.max()!
    let maxCop = problems.map { $0[1] }.max()!
    
    // 이미 달성한 경우
    if alp >= maxAlp && cop >= maxCop { return 0 }
    
    // 하나만 달성한 경우
    let alp = min(alp, maxAlp)
    let cop = min(cop, maxCop)
    
    var dp = [[Int]](repeating: [Int](repeating: Int(1e9), count: maxCop+1), count: maxAlp+1)
    dp[alp][cop] = 0
    
    for i in alp...maxAlp {
        for j in cop...maxCop {
            // 알고리즘 공부
            if i+1 <= maxAlp {
                dp[i+1][j] = min(dp[i+1][j], dp[i][j] + 1)
            }
            
            // 코딩 공부
            if j+1 <= maxCop {
                dp[i][j+1] = min(dp[i][j+1], dp[i][j] + 1)
            }
            
            // 문제 풀기
            for p in problems {
                // 문제를 풀 수 있을 때만
                guard i >= p[0] && j >= p[1] else { continue }
                
                // 범위를 벗어나는 경우 조정
                let nextAlp = min(i + p[2], maxAlp)
                let nextCop = min(j + p[3], maxCop)
                
                dp[nextAlp][nextCop] = min(dp[nextAlp][nextCop], dp[i][j] + p[4])
            }
        }
    }
    
    return dp[maxAlp][maxCop]
}

print(solution(10, 10, [[10,15,2,1,2],[20,20,3,3,4]]))
print(solution(0, 0, [[0,0,2,1,2],[4,5,3,1,2],[4,11,4,0,2],[10,4,0,4,2]]))
