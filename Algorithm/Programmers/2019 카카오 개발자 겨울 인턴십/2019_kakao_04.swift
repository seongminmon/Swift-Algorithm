//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/06/26.
//
// 징검다리 건너기
// 2019 카카오 개발자 겨울 인턴십
// Lv. 3
// https://school.programmers.co.kr/learn/courses/30/lessons/64062

import Foundation

func solution(_ stones:[Int], _ k:Int) -> Int {
    var start = 1
    var end = 200_000_000
    var ans = -1
    while start <= end {
        let mid = (start + end) / 2
        
        var maxCnt = 0
        var cnt = 0
        for i in 0..<stones.count {
            if stones[i] <= mid {
                cnt += 1
            } else {
                cnt = 0
            }
            maxCnt = max(maxCnt, cnt)
        }
        
        if k > maxCnt {
            start = mid + 1
            ans = mid
        } else {
            end = mid - 1
        }
    }
    
    return ans + 1
}

print(solution([2, 4, 5, 3, 2, 1, 4, 2, 5, 1], 3))
