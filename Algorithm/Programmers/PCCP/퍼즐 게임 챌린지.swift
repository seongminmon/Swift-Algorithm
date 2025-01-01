//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 12/7/24.
//
// [PCCP 기출문제] 2번 / 퍼즐 게임 챌린지
// PCCP 기출문제
// Lv.2
// https://school.programmers.co.kr/learn/courses/30/lessons/340212?language=swift

import Foundation

func solution(_ diffs:[Int], _ times:[Int], _ limit:Int64) -> Int {
    // 제한 시간(limit) 내에 퍼즐을 모두 해결하기 위한 숙련도(level)의 최솟값
    var start = 1
    var end = diffs.max()!
    var ans = diffs.max()!
    while start <= end {
        let mid = (start + end) / 2
        
        // level = mid일 때 전체 소요 시간 구하기
        var sum: Int64 = 0
        for i in 0..<diffs.count {
            let diff = diffs[i]
            let timeCur = times[i]
            let timePrev = i == 0 ? 0 : times[i-1]
            
            if diff <= mid {
                sum += Int64(timeCur)
            } else {
                sum += Int64((diff - mid) * (timeCur + timePrev))
                sum += Int64(timeCur)
            }
        }
        
        // 제한 시간 이내에 성공 했다면
        if sum <= limit {
            // 답 갱신
            ans = min(ans, mid)
            // 숙련도 낮춰서 탐색
            end = mid - 1
        } else {
            // 숙련도 올려서 탐색
            start = mid + 1
        }
    }
    
    return ans
}

print(solution([1, 5, 3], [2, 4, 7], 30)) // 3
print(solution([1, 4, 4, 2], [6, 3, 8, 2], 59)) // 2
print(solution([1, 328, 467, 209, 54], [2, 7, 1, 4, 3], 1723)) // 294
print(solution([1, 99999, 100000, 99995], [9999, 9001, 9999, 9001], 3456789012)) // 39354
