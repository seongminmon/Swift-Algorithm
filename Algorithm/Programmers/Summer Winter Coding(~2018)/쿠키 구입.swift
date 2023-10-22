//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/10/22.
//
// 쿠키 구입
// Summer/Winter Coding(~2018)
// Lv.4
// https://school.programmers.co.kr/learn/courses/30/lessons/49995

import Foundation

func solution(_ cookie:[Int]) -> Int {
    let n = cookie.count
    
    // 조기 종료
    if n == 1 { return 0 }
    
    // 누적합
    var sumArr = cookie
    for i in 1..<n { sumArr[i] += sumArr[i-1] }
    
    var ans = 0
    for mid in 0..<n-1 {
        var start = 0
        var end = n-1
        
        while start <= mid && mid < end {
            let sum1 = start == 0 ? sumArr[mid] : sumArr[mid] - sumArr[start-1]
            let sum2 = sumArr[end] - sumArr[mid]
            
            if sum1 < sum2 {
                end -= 1
            } else if sum1 > sum2 {
                start += 1
            } else {
                // 갱신
                ans = max(ans, sum1)
                break
            }
        }
    }
    
    return ans
}

print(solution([1,1,2,3]))
print(solution([1,2,4,5]))
